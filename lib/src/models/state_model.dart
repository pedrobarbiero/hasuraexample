import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class State {
  @JsonKey(name: 'state_id')
  int stateId;

  String name;

  State({this.name, this.stateId});

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}