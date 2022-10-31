import 'package:github_app/models/house.dart';
import 'package:hive_flutter/adapters.dart';

class HiveStorage {
  static String boxName = 'house_box';
  static Box<House>? box;

  static Future<void> initBox() async {
    box ??= await Hive.openBox(boxName);
  }

  static Future<House> saveHouse(House house) async {
    await initBox();
    final savedHouseKey = await box!.add(house);
    final savedHouse = box!.values.where((element) => element.key == savedHouseKey).first;
    return savedHouse;
  }

  static Future<List<House>> loadHouses() async {
    await initBox();
    final houses = box!.values ;
    return houses.toList();
  }

  static Future deleteHouse(House house) async {
    await initBox();
    box!.delete(house.key);
  }
}