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
      imgSrc: fields[2] as String,
      filter: fields[3] as FilterHiveModel,
    );
  }

  @override
  void write(BinaryWriter writer, CityHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imgSrc)
      ..writeByte(3)
      ..write(obj.filter);
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
