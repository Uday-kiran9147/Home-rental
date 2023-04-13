import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';
@JsonSerializable()
class Address {
  late String country;
  late String state;
  late String zipcode;
  late String street;

  Address(
      {required this.country,
      required this.state,
      required this.zipcode,
      required this.street});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
