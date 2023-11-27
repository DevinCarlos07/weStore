// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignupDetailsAdapter extends TypeAdapter<SignupDetails> {
  @override
  final int typeId = 1;

  @override
  SignupDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignupDetails(
      name: fields[0] as String,
      phone: fields[1] as String,
      email: fields[2] as String,
      createpassword: fields[3] as String,
      conformpassword: fields[4] as String,
      id: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SignupDetails obj) {
    writer
      ..writeByte(6)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.createpassword)
      ..writeByte(4)
      ..write(obj.conformpassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignupDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
