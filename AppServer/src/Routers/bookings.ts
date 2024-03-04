import { IBooking, bookingSchema } from "../Models/booking";
import Router from 'express'
import mongoose from "mongoose";

// Router 
export const bookingRoute = Router();

bookingRoute.post('/booking',async (req, res) => {

    const body = req.body;
    try {
        const booking: IBooking = ({
            _id: new mongoose.Types.ObjectId(),
            houseId: body.propertyId,
            userId: body.userId,
            bookingDate: body.bookingDate,
            checkIn: body.checkIn,
            checkOut: body.checkOut,
            price: body.price,
            guests: body.guests,
            numberOfDays: body.numberOfDays,

        });

        const createdBooking =await mongoose.model('Bookings',bookingSchema).create(booking);

        return res.status(200).json({ message: 'Booking created successfully', data: createdBooking })
    } catch (error) {
        console.log(error);
        
        return res.status(500).json({ message: 'Internal server error', error: error });
    }
});

bookingRoute.get('/bookings', async (req, res) => {
    try {
        const bookings = await mongoose.model('Bookings', bookingSchema).find();
        return res.status(200).json({ message: 'Bookings fetched successfully', data: bookings });
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error', error: error });
    }
});