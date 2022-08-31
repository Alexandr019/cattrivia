// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cattrivia_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatDataAdapter extends TypeAdapter<CatData> {
  @override
  final int typeId = 0;

  @override
  CatData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatData(
      fact: fields[0] as String,
      dateCreation: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CatData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.dateCreation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
