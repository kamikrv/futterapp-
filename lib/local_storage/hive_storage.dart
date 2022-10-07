
import 'package:github_app/models/house.dart';
import 'package:hive_flutter/adapters.dart';

class HiveStorage {
  static String boxName = 'house_box';

  static Future saveHouse(House house) async {
    var box = await Hive.openBox(boxName);
    box.add(house);
    await box.close();
  }

  // deleteItem(int index) {
  //   final box = Hive.box<Delivery>("deliveries");
  //
  //   box.deleteAt(index);
  // }

  static Future<List<House>> loadHouses() async {
    var box = await Hive.openBox<House>(boxName);
    final houses = box.values ;
    await box.close();
    return houses.toList();
  }

  static Future deleteHouse(House house) async {
    var box = await Hive.openBox(boxName);
    box.delete(house.key);
    await box.close();
  }
}