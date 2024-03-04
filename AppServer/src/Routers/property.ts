import { Router } from 'express';
import { IProperty } from '../Models/property';
import { propertySchema } from '../Models/property';
import mongoose from 'mongoose';

export var propertyRoute = Router();

// create a new property
propertyRoute.post('/addhouse', async (req, res) => {
    let body = req.body;

    let newProperty: IProperty = {
        maxGuests: body.maxGuests,
        _id: new mongoose.Types.ObjectId(),
        ownerId: body.ownerId,
        houseTitle: body.houseTitle,
        photos: body.photos,
        price: body.price,
        address: body.address,
        checkinTime: body.checkinTime,
        checkoutTime: body.checkoutTime,
        cleaningFee: body.cleaningFee,
        bedCount: body.bedCount,
        category: body.category,
        features: body.features,
        createdAt: new Date(),
        updatedAt: new Date()
    };

    try {
        let createdProperty = await mongoose.model('Property', propertySchema).create(newProperty);
        return res.status(200).json({ message: `Property created successfully `, property: createdProperty });
    } catch (err) {
        return res.status(500).json({ message: `Error creating property`, error: err });
    }
});

// update property
propertyRoute.put('/properties/:id', async (req, res) => {

    // if request contains this field then deny the update.
    let propertyId = req.params.id;
    let updateUser = req.body;
    const notallowedUpdates = ['_id', 'ownerId', 'createdAt', 'updatedAt'];
    let updates = Object.keys(updateUser);
    let isValidOperation = updates.every((update) => !notallowedUpdates.includes(update));
    if (!isValidOperation) {
        return res.status(400).json({ message: `Invalid updates` });
    }
    try {

        let updatedProperty = await mongoose.model('Property', propertySchema).findByIdAndUpdate(propertyId, updateUser, { new: true });
        if (!updatedProperty) {
            return res.status(404).json({ message: `Property not found` });
        }

        // await updatedProperty.save();
        return res.status(200).json({ message: `Property updated successfully`, property: updatedProperty });
    } catch (err) {
        return res.status(500).json({ message: `Error updating property`, error: err });
    }
});
//get all properties
propertyRoute.get('/properties', async (req, res) => {
    try {
        let properties = await mongoose.model('Property', propertySchema).find();
        return res.status(200).json(properties);
    } catch (err) {
        return res.status(500).json({ message: `Error fetching properties`, error: err });
    }
});

// delete property 
propertyRoute.delete('/properties/:id', async (req, res) => {
    let id = req.params.id;
    try {
        let property = await mongoose.model('Property', propertySchema).findByIdAndDelete(id);
        if (!property) {
            return res.status(404).json({ message: `Property not found` });
        }
        return res.status(200).json({ message: `Property deleted successfully`, property: property._id });
    } catch (err) {
        return res.status(500).json({ message: `Error deleting property`, error: err });
    }
});