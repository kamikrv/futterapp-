// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HouseAdapter extends TypeAdapter<House> {
  @override
  final int typeId = 0;

  @override
  House read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return House(
      price: fields[0] as String,
      countRooms: fields[1] as String,
      city: fields[2] as String,
      area: fields[3] as String,
      url: fields[4] as String,
      description: fields[5] as String,
    )..firebaseId = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, House obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.countRooms)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.area)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.firebaseId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HouseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
