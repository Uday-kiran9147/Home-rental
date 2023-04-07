const validator = require('validator')
const mongoose = require('mongoose')


const User = mongoose.model('rental-user', {
    name: {
        type: String,
        trim: true,
    },
    profile: {
        type: Buffer
    },
    address: {
        country: {
            type: String,
        },
        state: {
            type: String,
        }
    },
    gender: {
        type: String,
    },
    phonenumber: {
        type: String,
    },
    password: {
        type: String,
    },
    email: {
        type: String,
        required: true,
        lowercase: true,
        validate(value) {
            if (!validator.isEmail(value)) {
                throw new Error('Invalid email')
            }
        }
    },
    age: {
        type: Number,
        default: 0,
        validate(value) {
            if (value < 0) {
                throw new Error('Age must be greater than zero')
            }
        }

    }
})

// const user = new User(
//     {
//         name: 'nagam chandu',
//         profile: "",
//         address: {
//             country: 'Finland',
//             state: "curchil",
//         },
//         gender: 'Male',
//         phonenumber: '9876543212',
//         password: 'nagam password',
//         email: 'nagam@GMAIL.COM',
//         age: 45
//     }
// )

user.save().then((me) => {
    console.log(me)
}).catch((error) => {
    console.log('Error ' + error)
})