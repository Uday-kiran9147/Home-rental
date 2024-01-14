// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseProperty _$HousePropertyFromJson(Map<String, dynamic> json) =>
    HouseProperty(
      maxguests: json['maxguests'] as int,
      propertyid: json['propertyid'] as String,
      ownerId: json['owner'] as String,
      housetitle: json['housetitle'] as String,
      photos: json['photos'] as List<dynamic>,
      price: (json['price'] as num).toDouble(),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      checkintime: json['checkintime'] as String,
      checkouttime: json['checkouttime'] as String,
      cleaningfee: (json['cleaningfee'] as num).toDouble(),
      bedcount: json['bedcount'] as int,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      features: json['features'] as List<dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$HousePropertyToJson(HouseProperty instance) =>
    <String, dynamic>{
      'maxguests': instance.maxguests,
      'propertyid': instance.propertyid,
      'owner': instance.ownerId,
      'housetitle': instance.housetitle,
      'photos': instance.photos,
      'price': instance.price,
      'address': instance.address.toJson(),
      'checkintime': instance.checkintime,
      'checkouttime': instance.checkouttime,
      'cleaningfee': instance.cleaningfee,
      'bedcount': instance.bedcount,
      'category': instance.category,
      'features': instance.features,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      country: json['country'] as String,
      state: json['state'] as String,
      zipcode: json['zipcode'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'zipcode': instance.zipcode,
      'street': instance.street,
    };
