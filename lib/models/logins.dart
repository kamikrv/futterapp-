import 'package:hive_flutter/adapters.dart';

class MyUser extends HiveObject{
  String name;
  String city;

  MyUser({
    required this.name,
    required this.city,
  });
}