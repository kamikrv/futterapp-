
import 'package:github_app/models/house.dart';
import 'package:hive_flutter/adapters.dart';

class HiveStorage {
  static String boxName = 'house_box';
  static Box<House>? box;

  static Future<void> initBox() async {
    box ??= await Hive.openBox(boxName);
  }

  static Future saveHouse(House house) async {
    await initBox();
    box!.add(house);
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