// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coords_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoordsHiveModelAdapter extends TypeAdapter<CoordsHiveModel> {
  @override
  final int typeId = 2;

  @override
  CoordsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoordsHiveModel(
      lat: fields[0] as double,
      lng: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CoordsHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoordsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
