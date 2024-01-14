import 'package:json_annotation/json_annotation.dart';
part 'ownhouse.g.dart';
@JsonSerializable()
class OwnHouse {
  final String propertyId;
  final String ownerId;

  OwnHouse({
    required this.propertyId,
    required this.ownerId,
  });
  
  factory OwnHouse.fromJson(Map<String,dynamic> json)=> _$OwnHousesFromJson(json);
  Map<String,dynamic> toJson()=> _$OwnHousesToJson(this);
}
