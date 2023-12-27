// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CancelorderAdapter extends TypeAdapter<Cancelorder> {
  @override
  final int typeId = 21;

  @override
  Cancelorder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cancelorder(
      name: fields[1] as String,
      price: fields[2] as String,
      details: fields[3] as String,
      image: fields[4] as String,
      deliveryAddress: fields[6] as String,
      deliveryName: fields[7] as String,
      deliveryPhone: fields[8] as String,
      deliveryCity: fields[9] as String,
      pincode: fields[10] as String,
      productCount: fields[11] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Cancelorder obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.details)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.deliveryAddress)
      ..writeByte(7)
      ..write(obj.deliveryName)
      ..writeByte(8)
      ..write(obj.deliveryPhone)
      ..writeByte(9)
      ..write(obj.deliveryCity)
      ..writeByte(10)
      ..write(obj.pincode)
      ..writeByte(11)
      ..write(obj.productCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CancelorderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
