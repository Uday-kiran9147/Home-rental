// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseProperty _$HousePropertyFromJson(Map<String, dynamic> json) =>
    HouseProperty(
      maxguests: json['maxguests'] as int,
      propertyid: json['propertyid'] as String,
      owner: json['owner'] as String,
      housetitle: json['housetitle'] as String,
      photos: json['photos'] as List<dynamic>,
      price: (json['price'] as num).toDouble(),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      checkintime: json['checkintime'] as String,
      checkouttime: json['checkouttime'] as String,
      cleaningfee: (json['cleaningfee'] as num).toDouble(),
      bedcount: json['bedcount'] as int,
      category: json['category'] as List<dynamic>,
      features: json['features'] as List<dynamic>,
    );

Map<String, dynamic> _$HousePropertyToJson(HouseProperty instance) =>
    <String, dynamic>{
      'maxguests': instance.maxguests,
      'propertyid': instance.propertyid,
      'owner': instance.owner,
      'housetitle': instance.housetitle,
      'photos': instance.photos,
      'price': instance.price,
      'address': instance.address,
      'checkintime': instance.checkintime,
      'checkouttime': instance.checkouttime,
      'cleaningfee': instance.cleaningfee,
      'bedcount': instance.bedcount,
      'category': instance.category,
      'features': instance.features,
    };
