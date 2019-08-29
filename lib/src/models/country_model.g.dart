// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return CountryModel(
    countryId: json['country_id'] as int,
    name: json['name'] as String,
  )..states = (json['states'] as List)
      ?.map((e) =>
          e == null ? null : StateModel.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'country_id': instance.countryId,
      'name': instance.name,
      'states': instance.states,
    };
