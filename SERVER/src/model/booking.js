
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
    check_in: {
        type: String,
        required: true,

    },
    check_out: {
        type: String,
        required: true,

    },
    bookingprice: {
        type: Number,
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

// const booking = new Booking(
//     {
//         bookingdate: '12-mar',
//         bookingid: 'kdnsjpkjvnj34234',
//         check_in: '31-mar',
//         check_out: '2-april',
//         bookingprice: 103000,
//         numberofdays: 3,
//         userid: 'uday9999',
//         houseid: '893748392834234'
//     }
// )

module.exports =Booking;
