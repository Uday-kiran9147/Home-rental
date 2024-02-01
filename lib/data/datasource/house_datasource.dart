import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HouseDataSource {
  static final HouseDataSource _instance = HouseDataSource._();

  static Database? _database;

  Future<Database> get database async => _database ??= await _InitDB();

  HouseDataSource._() {
    _InitDB();
  }

  Future<Database> _InitDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'house.db');
    return openDatabase(path,version: 1,);
  }
}
