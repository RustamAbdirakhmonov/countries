// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountriesAdapter extends TypeAdapter<Countries> {
  @override
  final int typeId = 1;

  @override
  Countries read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Countries(
      countryName: fields[0] as String,
      capital: fields[1] as String,
      region: fields[2] as String,
      area: fields[3] as double,
      population: fields[4] as int,
      flagUrl: fields[5] as String,
      timeZone: fields[6] as String,
      maps: fields[7] as String,
      coatOfArms: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Countries obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.countryName)
      ..writeByte(1)
      ..write(obj.capital)
      ..writeByte(2)
      ..write(obj.region)
      ..writeByte(3)
      ..write(obj.area)
      ..writeByte(4)
      ..write(obj.population)
      ..writeByte(5)
      ..write(obj.flagUrl)
      ..writeByte(6)
      ..write(obj.timeZone)
      ..writeByte(7)
      ..write(obj.maps)
      ..writeByte(8)
      ..write(obj.coatOfArms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
