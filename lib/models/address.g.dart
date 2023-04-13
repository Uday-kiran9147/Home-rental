// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      country: json['country'] as String,
      state: json['state'] as String,
      zipcode: json['zipcode'] as String,
      street: json['street'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'state': instance.state,
      'zipcode': instance.zipcode,
      'street': instance.street,
    };
