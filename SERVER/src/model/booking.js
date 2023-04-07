
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
        type: String,
    },
    guests: {
        type: String,
        required: true,
    },
    numberofdays: {
        type: String,
    },
    userid: {
        type: String,
    },
    houseid: {
        type: String,
    },
})



module.exports = Booking;
