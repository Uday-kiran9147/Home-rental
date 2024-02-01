import 'package:houserental/data/data.dart';

abstract class HouseRepository{
  Future<List<HouseProperty>> getAllHouses();
  Future<HouseProperty> getHouse(int id);
  Future<HouseProperty> createHouse(HouseProperty newHouse);
  Future<HouseProperty> updateHouse(HouseProperty house);
  Future<void> deleteHouse(int id);
}