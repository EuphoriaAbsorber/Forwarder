// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilterHiveModelAdapter extends TypeAdapter<FilterHiveModel> {
  @override
  final int typeId = 1;

  @override
  FilterHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilterHiveModel(
      price: fields[0] as int,
      sea: fields[1] as int,
      mountains: fields[2] as int,
      culture: fields[3] as int,
      architecture: fields[4] as int,
      shopping: fields[5] as int,
      entertainment: fields[6] as int,
      nature: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FilterHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.price)
      ..writeByte(1)
      ..write(obj.sea)
      ..writeByte(2)
      ..write(obj.mountains)
      ..writeByte(3)
      ..write(obj.culture)
      ..writeByte(4)
      ..write(obj.architecture)
      ..writeByte(5)
      ..write(obj.shopping)
      ..writeByte(6)
      ..write(obj.entertainment)
      ..writeByte(7)
      ..write(obj.nature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
