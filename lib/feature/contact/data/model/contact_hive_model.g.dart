// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactHiveModelAdapter extends TypeAdapter<ContactHiveModel> {
  @override
  final int typeId = 2;

  @override
  ContactHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactHiveModel(
      contactId: fields[0] as String?,
      email: fields[1] as String,
      message: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.contactId)
      ..writeByte(1)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
