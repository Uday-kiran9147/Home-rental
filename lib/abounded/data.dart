class AboundandData{
  
  List<Pet> homeList = [
    Pet(
        id: '01',
        state: "Hyderabad",
        country: "India",
        city: "Mgbs",
        price: 22000,
        petname: "Villa with master Bus station",
        category: 'Pool'),
    Pet(
        id: '02',
        state: "Maharashtra",
        country: "India",
        city: "Pune",
        price: 15000,
        petname: "Apartment with Balcony",
        category: 'Garden'),
    Pet(
        id: '03',
        state: "Karnataka",
        country: "India",
        city: "Bangalore",
        price: 24000,
        petname: "Villa with Private Pool",
        category: 'Balcony'),
    Pet(
        id: '04',
        state: "Goa",
        country: "India",
        city: "Baga",
        price: 20000,
        petname: "Bungalow with Modern Interiors",
        category: 'Garden'),
    Pet(
        id: '05',
        state: "West Bengal",
        country: "India",
        city: "Kolkata",
        price: 18000,
        petname: "Cottage with Private Garden",
        category: 'Terrace'),
    Pet(
        id: '06',
        state: "Uttar Pradesh",
        country: "India",
        city: "Lucknow",
        price: 20000,
        petname: "Villa with Private Gym",
        category: 'Balcony'),
    Pet(
        id: '07',
        state: "Delhi",
        country: "India",
        city: "Rohini",
        price: 21000,
        petname: "Apartment with Balcony delhi",
        category: 'Terrace'),
    Pet(
        id: '08',
        state: "Haryana",
        country: "India",
        city: "Gurgaon",
        price: 25000,
        petname: "Gurgaon Villa with Private Garden",
        category: 'Garden'),
    Pet(
        id: '09',
        state: "Rajasthan",
        country: "India",
        city: "Jaipur",
        price: 22000,
        petname: "Bungalow with Modern Interiors",
        category: 'Pool'),
    Pet(
        id: '10',
        state: "Gujarat",
        country: "India",
        city: "Ahmedabad",
        price: 19000,
        petname: "Cottage with Private Terrace",
        category: 'Balcony'),
    Pet(
        id: '11',
        state: "Tamil Nadu",
        country: "India",
        city: "Chennai",
        price: 23000,
        petname: "Villa with Master Bedroom",
        category: 'Terrace')
  ];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Pet {
  String id;
  String state;
  String country;
  String city;
double price;
  String petname;
  String category;
   Pet({
    required this.id,
    required this.state,
    required this.country,
    required this.city,
    required this.price,
    required this.petname,
    required this.category,
  });

}
