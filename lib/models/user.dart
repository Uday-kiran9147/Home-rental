// ignore_for_file: public_member_api_docs, sort_constructors_first
/* 1-add @JsonSerializable() to the class for all the classes
2- part 'property.g.dart'; 
3- fromjson-----i) factory HouseProperty.fromJson(Map<String, dynamic> json) =>_$HousePropertyFromJson(json);
      tojson--------ii) Map<String, dynamic> toJson() => _$HousePropertyToJson(this);
4- flutter pub run build_runner build --delete-conflicting-outputs 
5- flutter pub run build_runner watch --delete-conflicting-outputs */
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true /*  for nested class this is required*/)
class User {
  String? name;
  String? profile;
  Address? address;
  String? gender;
  String? phonenumber;
  String? password;
  String? email;
  int? age;
  User({
    @required this.name,
    this.profile,
    this.address,
    this.gender,
    @required this.phonenumber,
    @required this.password,
    @required this.email,
    this.age,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Address {
  String? country;
  String? state;
  Address({
    this.country,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
