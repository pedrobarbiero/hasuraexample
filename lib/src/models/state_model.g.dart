// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) {
  return State(
    name: json['name'] as String,
    stateId: json['state_id'] as int,
  );
}

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'state_id': instance.stateId,
      'name': instance.name,
    };
