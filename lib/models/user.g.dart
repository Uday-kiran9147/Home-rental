// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
      profile: json['profile'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      gender: json['gender'] as String?,
      phonenumber: json['phonenumber'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'profile': instance.profile,
      'address': instance.address?.toJson(),
      'gender': instance.gender,
      'phonenumber': instance.phonenumber,
      'password': instance.password,
      'email': instance.email,
      'age': instance.age,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'state': instance.state,
    };
