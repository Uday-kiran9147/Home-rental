// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      name: json['name'] as String?,
      profileURL: json['profileURL'] as String?,
      address: json['address'] == null
          ? null
          : UserAddress.fromJson(json['address'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      phonenumber: json['phonenumber'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      age: json['age'] as int?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'profileURL': instance.profileURL,
      'address': instance.address?.toJson(),
      'gender': instance.gender,
      'phonenumber': instance.phonenumber,
      'password': instance.password,
      'email': instance.email,
      'age': instance.age,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'state': instance.state,
    };
