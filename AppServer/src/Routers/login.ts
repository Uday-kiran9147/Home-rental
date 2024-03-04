import { Router } from 'express';
export var loginRoute = Router();
import mongoose from 'mongoose';
import { IUser, userSchema } from '../Models/user';

loginRoute.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({ message: 'Password and E-mail are required fields' })
        }
        const user = await mongoose.model('User', userSchema).findOne({ email: email });
        if (!user) {
            return res.status(400).json({ message: 'User not found' })
        }
        if (user.password !== password) {
            return res.status(400).json({ message: 'Invalid password' })
        }
        return res.status(200).json({ message: 'Login successful',data:user });
    } catch (err) {
        res.status(500).json({ message: 'Internal server error' });
    }
});

