// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddCartAdapter extends TypeAdapter<AddCart> {
  @override
  final int typeId = 3;

  @override
  AddCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddCart(
      name: fields[2] as String,
      price: fields[3] as String,
      details: fields[4] as String,
      imagepath: fields[5] as String,
      count: fields[6] as int,
      id: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AddCart obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.details)
      ..writeByte(5)
      ..write(obj.imagepath)
      ..writeByte(6)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
