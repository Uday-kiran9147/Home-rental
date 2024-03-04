import Mongoose from "mongoose";
import express from "express";
import { signUpRoute } from "./Routers/signup";
import { loginRoute } from "./Routers/login";
import { propertyRoute } from "./Routers/property";
import bodyParser from "body-parser";
import { bookingRoute } from "./Routers/bookings";



const PORT = 3000;
const app = express();
app.use(express.json())
app.use(bodyParser.urlencoded({ extended: true }));

async function initializeMongoDBConnection() {
    console.log("Connecting........");
    try {
        await Mongoose.connect('mongodb://127.0.0.1:27017/HouseRentals', { retryWrites: true, w: 'majority' });
        console.log('Connected to MongoDB');
    } catch (err) {
        console.error('Error connecting to MongoDB');
    }
}

initializeMongoDBConnection()

app.use(signUpRoute);
app.use(loginRoute);
app.use(propertyRoute);
app.use(bookingRoute);
app.listen(3000, () => console.log(`Server started on port http://localhost:${PORT}`));

