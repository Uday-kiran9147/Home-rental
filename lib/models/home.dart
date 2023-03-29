class User {
  final String name;
  final int age;
  final String gender;
  User({
    required this.name,
    required this.age,
    required this.gender,
  });
}

enum Address {
  street,
  locality;
}

class Home {
  final String pincode;
  final String country;
  final String locality;
  final String state;
  Home({
    required this.pincode,
    required this.country,
    required this.locality,
    required this.state,
  });
}
