// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAddAdapter extends TypeAdapter<CategoryAdd> {
  @override
  final int typeId = 8;

  @override
  CategoryAdd read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryAdd(
      catname: fields[1] as String,
      catimage: fields[2] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryAdd obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.catname)
      ..writeByte(2)
      ..write(obj.catimage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAddAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
