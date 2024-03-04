/* UserAddress {
  String? country;
  String? state; */

import { Schema } from "mongoose";

export interface IAddress {
    country?: string;
    state?: string;
    city?: string;
    street?: string;
    zip?: string;
}

export let userSchems: Schema = new Schema<IAddress>({
    country: { type: String },
    state: { type: String },
    city: { type: String },
    street: { type: String },
    zip: { type: String },
})
