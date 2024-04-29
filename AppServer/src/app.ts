import Mongoose from "mongoose";
import express from "express";
import { signUpRoute } from "./Routers/signup";
import { loginRoute } from "./Routers/login";
import { propertyRoute } from "./Routers/property";
import bodyParser from "body-parser";
import { bookingRoute } from "./Routers/bookings";


const mongooseUrl = "mongodb+srv://udaykiran9147:zoGPC7VIL3pZStRI@cluster0.pap26w0.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
const PORT = 3000;

const app = express();
app.use(express.json())
app.use(bodyParser.urlencoded({ extended: true }));

async function initializeMongoDBConnection() {
    console.log("Connecting........");
    try {
        await Mongoose.connect(mongooseUrl, { retryWrites: true, w: 'majority' });
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
app.listen(3000, () => console.log(`Server started on port https://houserental.onrender.com`));

