import 'package:hive_flutter/adapters.dart';

part 'house.g.dart';

@HiveType(typeId: 0)
class House extends HiveObject{
  @HiveField(0)
  late String price;
  @HiveField(1)
  late String countRooms;
  @HiveField(2)
  late String city;
  @HiveField(3)
  late String area;
  @HiveField(4)
  late String url;
  @HiveField(5)
  late String description;
  @HiveField(6, defaultValue: false)
  bool isFavorite;


  House({
    required this.price,
    required this.countRooms,
    required this.city,
    required this.area,
    required this.url,
    required this.description,
    required this.isFavorite,
  });
}