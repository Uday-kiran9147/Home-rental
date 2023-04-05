const User = mongoose.model('rental-user', {
    bookingdate: {
        type: String,
        trim: true,
    },
    bookingid: {
        type: Buffer,
        required: true,
    },
    check_in: {
        type: String,
        required: true,

    },
    check_out: {
        type: String,
        required: true,

    },
    bookingprice: {
        type: String,
    },
    numberofguests: {
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
    userid: {
        type: Number,
    },
    paymentid: {
        type: String,
    },
    paymentdate: {
        type: String,
    },
    houseid: {
        type: String,
    },
})

const me = new User(
    {
        name: 'nagam chandu',
        profile: "",
        address: {
            country: 'Finland',
            state: "curchil",
        },
        gender: 'Male',
        phonenumber: '9876543212',
        password: 'nagam password',
        email: 'nagam@GMAIL.COM',
        age: 45
    }
)
