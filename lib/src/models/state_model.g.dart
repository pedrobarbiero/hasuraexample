// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return StateModel(
    name: json['name'] as String,
    stateId: json['state_id'] as int,
  )..countryId = json['country_id'] as int;
}

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'state_id': instance.stateId,
      'country_id': instance.countryId,
      'name': instance.name,
    };
