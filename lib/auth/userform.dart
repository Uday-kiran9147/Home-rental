import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:houserental/screens/home_screen.dart';
import 'package:houserental/services/apiservice.dart';

import '../models/user.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? profile;
  UserAddress? address;
  String? gender;
  String? phoneNumber;
  String? password;
  String? email;
  int? age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'phone number'),
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),

              // Add TextFormField widgets for the other fields
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, create a User object
                    User user = User(
                      name: name,
                      profile: profile,
                      address: address,
                      gender: gender,
                      phonenumber: phoneNumber,
                      password: password,
                      email: email,
                      age: age,
                    );
                    ApiService.adduser(user);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                    //@required this.name,
                    // this.profile,
                    // this.address,
                    // this.gender,
                    // @required this.phonenumber,
                    // @required this.password,
                    // @required this.email,
                    // this.age,
                    // print((user.toJson()));
                    // Do something with the user object, such as save it to a database
                    // or display it in a confirmation dialog
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
