// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserFeedbackAdapter extends TypeAdapter<UserFeedback> {
  @override
  final int typeId = 30;

  @override
  UserFeedback read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserFeedback(
      feedback: fields[1] as String,
      name: fields[2] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserFeedback obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.feedback)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserFeedbackAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
