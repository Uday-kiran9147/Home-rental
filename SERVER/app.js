
const express = require("express");
require('./src/database/db');

const Booking = require('./src/model/booking')
const HouseProperty = require('./src/model/property')
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

app.get('/allhouse', (req, res) => {

    HouseProperty.find({}).then((property) => {
        res.send(property)
    }).catch(err => {
        res.status(500).send(err)
    })
})

app.post('/addhouse', (req, res) => {
    const houseproperty = new HouseProperty(req.body)
    houseproperty.save().then((house) => {
        res.send(house)
    }).catch((error) => {
        res.status(500).send(error)
    })
})

app.listen(port, () => {
    console.log("Server listening on port " + port);
});