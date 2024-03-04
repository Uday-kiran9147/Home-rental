/*   String? bookingdate;
  String? bookingid;
  DateTime? checkin;
  DateTime? checkout;
  double? bookingprice;
  int? guests;
  int? numberofdays;
  String? userid;
  String? houseid; */

import mongoose from 'mongoose';
export interface IBooking {
  _id: any;
  userId: string;
  houseId: string;
  bookingDate: string;
  checkIn: String;
  checkOut: String;
  price: number;
  guests: number;
  numberOfDays: number;
}

export let bookingSchema: mongoose.Schema = new mongoose.Schema<IBooking>({
  _id: { type: String },
  userId: { type: String,},
  houseId: { type: String,},
  bookingDate: { type: String,},
  checkIn: { type: String,},
  checkOut: { type: String,},
  price: { type: Number,},
  guests: { type: Number,},
  numberOfDays: { type: Number,},
});

// export default mongoose.model('Booking', bookingSchema);