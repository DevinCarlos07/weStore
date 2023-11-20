// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addproduct_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddproductsAdapter extends TypeAdapter<Addproducts> {
  @override
  final int typeId = 2;

  @override
  Addproducts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addproducts(
      imagepath: fields[6] as String,
      name: fields[0] as String,
      price: fields[1] as String,
      details: fields[3] as String,
      id: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Addproducts obj) {
    writer
      ..writeByte(5)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.details)
      ..writeByte(6)
      ..write(obj.imagepath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddproductsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
