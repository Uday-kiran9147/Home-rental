const mongoose = require('mongoose')



const addressschema = mongoose.Schema(
    {
        country: {
            type: String,
        },
        state: {
            type: String,
        },
        city: {
            type: String,
        },
        street: {
            type: String,
        },
        zipcode: {
            type: String,
        }
    },
)

const HouseProperty = mongoose.model('HouseProperty', {

    maxguests: {
        type: Number,
        required: true,
    },
    propertyid: {
        type: String,
        require
    },
    owner: {
        type: String,
        require
    },
    housetitle: {
        type: String,
        require
    },
    propertyphotos: [
        {
            type: String,
        }
    ],
    price: {
        type: Number,
        required: true,
    },
    address: [addressschema],
    checkintime: {
        type: String,
        required: true,
    },
    checkouttime: {
        type: String,
        required: true,
    },
    cleaningfee: {
        type: String,
        // required: true,
    },
    bedcount: {
        type: Number,
        required: true,
    },
    category: [
        {
            type: String,
        }
    ],
    features: [
        {
            type: String,
        }
    ]
})

const houseproperty = new HouseProperty({
    maxguests: 4,
    propertyid: 'ABC123',
    owner: 'John Doe',
    housetitle: 'Cozy Cabin',
    propertyphotos: ['photo1.jpg', 'photo2.jpg'],
    price: 100,
    address: {
        country: 'USA',
        state: 'California',
        city: 'Los Angeles',
        street: '123 Main St',
        zipcode: '90001'
    },
    checkintime: '2:00 PM',
    checkouttime: '11:00 AM',
    cleaningfee: '50',
    bedcount: 2,
    category: ['Vacation Rental', 'Cabin'],
    features: ['Wifi', 'Fireplace', 'Air Conditioning']
})


module.exports = HouseProperty