// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityHiveModelAdapter extends TypeAdapter<CityHiveModel> {
  @override
  final int typeId = 0;

  @override
  CityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityHiveModel(
      id: fields[0] as int,
      name: fields[1] as String,
      imgSrc: fields[4] as String,
      country: fields[2] as String,
      coords: fields[5] as CoordsHiveModel,
      description: fields[3] as String,
      filter: fields[6] as FilterHiveModel,
      airport: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.imgSrc)
      ..writeByte(5)
      ..write(obj.coords)
      ..writeByte(6)
      ..write(obj.filter)
      ..writeByte(7)
      ..write(obj.airport);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
