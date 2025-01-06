// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'd_day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DDayAdapter extends TypeAdapter<DDay> {
  @override
  final int typeId = 10;

  @override
  DDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DDay(
      id: fields[0] as String?,
      goalTitle: fields[1] as String,
      goalDate: fields[2] as int,
      color: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DDay obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.goalTitle)
      ..writeByte(2)
      ..write(obj.goalDate)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DDayImpl _$$DDayImplFromJson(Map<String, dynamic> json) => _$DDayImpl(
      id: json['id'] as String?,
      goalTitle: json['goalTitle'] as String,
      goalDate: (json['goalDate'] as num).toInt(),
      color: json['color'] as String,
    );

Map<String, dynamic> _$$DDayImplToJson(_$DDayImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goalTitle': instance.goalTitle,
      'goalDate': instance.goalDate,
      'color': instance.color,
    };
