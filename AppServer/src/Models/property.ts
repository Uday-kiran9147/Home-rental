/* HouseProperty {
  int maxguests;
  String propertyid;
  String ownerId;
  String housetitle;
  List<dynamic> photos;
  double price;
  Address address;
  String checkintime;
  String checkouttime;
  double cleaningfee;
  int bedcount;
  List<String> category;
  List<dynamic> features;
  DateTime createdAt;
  DateTime updatedAt; */
import mongoose from 'mongoose';
import { IAddress } from './address';
export interface IProperty {
  maxGuests: number;
  _id: any;
  ownerId: string;
  houseTitle: string;
  photos: string[];
  price: number;
  address: IAddress;
  checkinTime: string;
  checkoutTime: string;
  cleaningFee: number;
  bedCount: number;
  category: string[];
  features: string[];
  createdAt: Date;
  updatedAt: Date;
}

// we see [mongoose.Schema] here and Schema in the user.ts file. to get idea look at imports in both the files(property.ts & user.ts).
//This is a class that takes a generic type. The generic type is the interface that we created. This is a way of telling the class that we want to use the interface as a type for the schema. We also see that we are exporting the schema. This is because we will need to use it in other files. We will use it in the file where we will be creating the model. The model is a class that we will use to interact with the database. We will create the model in the next section.
export let propertySchema: mongoose.Schema = new mongoose.Schema<IProperty>({
  maxGuests: { type: Number, default: 2 },
  _id: { type: String, required: true },
  ownerId: { type: String, required: true },
  houseTitle: { type: String, required: true },
  photos: { type: [String], required: true, default: [] },
  price: { type: Number, required: true, },
  address: { type: Object, required: true },
  checkinTime: { type: String, default: "default checkin time" },
  checkoutTime: { type: String, default: "default checkout time" },
  cleaningFee: { type: Number, default: 1200 },
  bedCount: { type: Number, default: 1 },
  category: { type: [String] },
  features: { type: [String] },
  createdAt: { type: Date },
  updatedAt: { type: Date },
});