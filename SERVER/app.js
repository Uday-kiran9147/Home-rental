// const express = require('express');
// const app = express();


// app.get('/', function (req, res) {
//     res.send("Testing going on.....");
// });

// app.get('/categoties', (req, res) => res.send("we are in a category screen"))

// const PORT = 3000;
// app.listen(PORT, function (req, res) {
//     console.log("listening on port 3000...");
// })

var express = require("express");
var app = express();
var port = 3000;

const mongoose = require('mongoose');
const bodyparser = require('body-parser');

var nameSchema = new mongoose.Schema(
    {
        firstName: String,
        lastName: String
    }
);
var User = mongoose.model("User", nameSchema);
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost:27017/nodedemo');


app.use("/login", (req, res) => {
    res.send("/index.html");
});

app.post('/addname', (req, res) => {
    var myData =  User(req.body);
    myData.save().then(item => {
        res.send("item saved successfully");
    }).catch(err => {
        res.status(400).send('unable to save to database');
    });
});

app.listen(port, () => {
    console.log("Server listening on port " + port);
});