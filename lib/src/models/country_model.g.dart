// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    countryId: json['country_id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country_id': instance.countryId,
      'name': instance.name,
    };
