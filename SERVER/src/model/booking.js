
const mongoose = require('mongoose')
const Booking = mongoose.model('booking', {
    bookingdate: {
        type: String,
        trim: true,
    },
    bookingid: {
        type: String,
        required: true,
    },
    checkin: {
        type:String,
        required: true,

    },
    checkout: {
        type: String,
        required: true,

    },
    bookingprice: {
        type: Number,
    },
    guests: {
        type: Number,
        required: true,
    },
    numberofdays: {
        type: Number,
    },
    userid: {
        type: String,
    },
    houseid: {
        type: String,
    },
})



module.exports = Booking;
