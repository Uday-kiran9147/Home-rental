
const express = require("express");
const app = express();
const port =process.env.PORT ||8000;

require('./src/connection/connect')

app.post("/", (req, res) => {
    res.send("HOME page");
});


app.listen(port, () => {
    console.log("Server listening on port " + port);
});