import 'package:hive_flutter/adapters.dart';
part 'house.g.dart';

@HiveType(typeId: 0)
class House extends HiveObject{
  @HiveField(0)
  String price;
  @HiveField(1)
  String countRooms;
  @HiveField(2)
  String city;
  @HiveField(3)
  String area;
  @HiveField(4)
  String url;
  @HiveField(5)
  String description;
  @HiveField(6, defaultValue: false)
  bool isFavorite;
  @HiveField(7)
  String? firebaseId;


  House({
    required this.price,
    required this.countRooms,
    required this.city,
    required this.area,
    required this.url,
    required this.description,
    required this.isFavorite,
  });

  factory House.fromFirebase(String id, Map map) {
    final house = House(
        price: (map['Price'] ?? 0).toString(),
        countRooms: (map['Count of rooms'] ?? 0).toString(),
        city: map['City'] ?? '-',
        area: (map['Total area']).toString(),
        url: map['Image'] ?? 'https://i.pinimg.com/736x/29/bf/1f/29bf1f05eafffb8a2ac992ed4456c8c1.jpg',
        description: map['Description'] ?? '-',
        isFavorite: false
    );
    house.firebaseId = id;
    return house;
  }
}