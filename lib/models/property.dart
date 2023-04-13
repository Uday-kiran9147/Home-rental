import 'address.dart';

import 'package:json_annotation/json_annotation.dart';
part 'property.g.dart';
/* 
1-add @JsonSerializable() to the class
2- part 'property.g.dart'; 
3- fromjson-----i) factory HouseProperty.fromJson(Map<String, dynamic> json) =>_$HousePropertyFromJson(json);
      tojson--------ii) Map<String, dynamic> toJson() => _$HousePropertyToJson(this);
4- flutter pub run build_runner build --delete-conflicting-outputs 
5- flutter pub run build_runner watch --delete-conflicting-outputs
*/
@JsonSerializable()
class HouseProperty {
  int maxguests;
  String propertyid;
  String owner;
  String housetitle;
  List<dynamic> photos;
  double price;
  Address address;
  String checkintime;
  String checkouttime;
  double cleaningfee;
  int bedcount;
  List<dynamic> category;
  List<dynamic> features;

  HouseProperty({
    required this.maxguests,
    required this.propertyid,
    required this.owner,
    required this.housetitle,
    required this.photos,
    required this.price,
    required this.address,
    required this.checkintime,
    required this.checkouttime,
    required this.cleaningfee,
    required this.bedcount,
    required this.category,
    required this.features,
  });
  factory HouseProperty.fromJson(Map<String, dynamic> json) =>
      _$HousePropertyFromJson(json);
  Map<String, dynamic> toJson() => _$HousePropertyToJson(this);
}
