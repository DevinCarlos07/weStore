// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressmodelAdapter extends TypeAdapter<Addressmodel> {
  @override
  final int typeId = 10;

  @override
  Addressmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Addressmodel(
      name: fields[2] as String,
      contact: fields[3] as String,
      address: fields[4] as String,
      city: fields[6] as String,
      id: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Addressmodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.contact)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
