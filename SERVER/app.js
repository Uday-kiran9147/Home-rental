
const express = require("express");
require('./src/database/db');

const Booking = require('./src/model/booking')
const app = express();
const port = process.env.PORT || 5000;

app.post("/", (req, res) => {
    res.send("HOME page");
});

app.use(express.json())

app.post('/addbooking', (req, res) => {

    const booking = new Booking(req.body)
    booking.save().then((booking) => {
        res.status(201).send(booking)
    }).catch((error) => {
        res.status(500).send(error)
    })
})

app.listen(port, () => {
    console.log("Server listening on port " + port);
});