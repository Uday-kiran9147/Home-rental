import mongoose, { Schema, Document } from 'mongoose';
/* User {
  String uid;--
  String? name;--
  String? profileURL;--
  UserAddress? address;--
  String? gender;--
  String? phonenumber;--
  String? password;--
  String? email;--
  int? age;--
  final DateTime createdAt;--
  DateTime updatedAt; -- */
import { IAddress } from './address';
export interface IUser {
    _id: any;
    name: string;
    email: string;
    password: string;
    avatar?: string;
    address?: IAddress;
    gender?: string;
    phoneNumber?: string;
    age?: number;
    createdAt: Date;
    updatedAt: Date;
}

export let userSchema: Schema = new Schema<IUser>({
    _id: { type: String },
    name: { type: String, required: true },
    password: { type: String, required: true },
    email: { type: String, required: true ,unique:true},
    avatar: { String,  },
    address: { type: Object },
    gender: { type: String },
    phoneNumber: { type: String },
    age: { type: Number },
    createdAt: { type: Date },
    updatedAt: { type: Date,},
});