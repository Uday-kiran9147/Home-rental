import { Router } from 'express';
import mongoose from 'mongoose';
import multer from 'multer';
import { IUser, userSchema } from '../Models/user';
import admin from 'firebase-admin';

export const signUpRoute = Router();

// Initialize Firebase Admin SDK with your service account credentials
const serviceAccount = require('../../service_account.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    storageBucket: 'gs://ninja-5cdbe.appspot.com', //  storage bucket URL
});



// create a new user.
signUpRoute.post('/signup', async (req, res) => {
    let { name, email, password, avatar } = req.body;
    if (!email || !password) {
        return res.status(400).json({ message: 'Password and E-mail are required fields' })
    }

    if (!req.body.password || req.body.password.length < 6) {
        return res.status(400).json({ message: 'Password must be at least 6 characters long' })
    }

    let newUser: IUser = {
        _id: new mongoose.Types.ObjectId(),
        name: name,
        email: email,
        password: password,
        avatar: avatar,
        address: req.body.address,
        gender: req.body.gender,
        phoneNumber: req.body.phoneNumber,
        age: req.body.age,
        createdAt: new Date(),
        updatedAt: new Date(),
    }

    try {
        const createdUser = await mongoose.model('User', userSchema).create(newUser);
        return res.status(201).json({ message: `User created successfully ${newUser.name}`, data: createdUser });
    } catch (error: any) {
        if (error.code === 11000) {
            return res.status(400).json({ message: 'User already exists' });
        }
        res.status(500).json({ message: 'Internal server error', error: error });
    }
});

// Set up Multer for handling file uploads
const storage = multer.memoryStorage();
// const upload = multer({ storage: storage });

const upload = multer({ storage: storage }).single('avatar');


// update user profile
signUpRoute.put('/users/:id', upload, async (req, res) => {
    const notallowedUpdates = ['email'];

    try {
        const id = req.params.id;
        const updatedUser: IUser = req.body;

        if (!id) {
            return res.status(400).json({ message: 'User ID is required' });
        }

        const updates = Object.keys(req.body);
        const isNotValidUpdate = updates.some((update) => notallowedUpdates.includes(update));

        if (isNotValidUpdate) {
            return res.status(400).json({ message: 'Email cannot update' });
        }

        if (req.body.password && req.body.password.length < 6) {
            return res.status(400).json({ message: 'Password must be at least 6 characters long' });
        }

        if (req.file) {
            // Get the file from the request
            const file = req.file;

            if (!file) {
                return res.status(400).json({ error: 'No file provided' });
            }

            // Create a unique filename (you may use other strategies based on your requirements)
            await uploadUserAvatar(file, updatedUser);

            await updateUserInDatabase(id, updatedUser, res);

        } else {
            // If no file is provided in the request, update the user in the database without changing the avatar
            await updateUserInDatabase(id, updatedUser, res);
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error' });
    }

    // helper function to file to Firebase Storage
    async function uploadUserAvatar(file: Express.Multer.File, updatedUser: IUser) {
        const filename = `${Date.now()}-BlissBungalows-${file.originalname}`;

        // Create a storage reference with the desired path
        const storageRef = admin.storage().bucket().file(filename);

        // Upload the file to the storage reference
        await storageRef.createWriteStream().end(file.buffer);

        // Get the download URL of the uploaded file
        const downloadURL = await storageRef.getSignedUrl({ action: 'read', expires: '03-09-2025' });
        updatedUser.avatar = await downloadURL[0];
    }
});

// helper function to update user in the database
async function updateUserInDatabase(id: string, updatedUser: IUser, res: any) {
    try {
        const user: IUser | null = await mongoose.model('Users', userSchema).findByIdAndUpdate(id, updatedUser, { new: true });

        if (!user) {
            return res.status(404).json({ message: 'User not found' });
        }

        return res.status(200).json({ message: 'Updated successfully', data: user });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ message: 'Internal server error' });
    }
}

// delete user
signUpRoute.delete('/users/:id', async (req, res) => {
    let id = req.params.id;
    try {
        let user = await mongoose.model('User', userSchema).findByIdAndDelete(id);
        if (!user) {
            return res.status(404).json({ message: `User not found` });
        }
        return res.status(200).json({ message: `User deleted successfully`, user: user._id });
    } catch (err) {
        return res.status(500).json({ message: `Error deleting user`, error: err });
    }
});


// list users
signUpRoute.get('/users', async (req, res) => {
    try {
        let users = await mongoose.model('User', userSchema).find();
        return res.status(200).json(users);
    } catch (err) {
        return res.status(500).json({ message: `Error fetching users`, error: err });
    }
});
