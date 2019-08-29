import 'package:hasuraexample/src/models/country_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: 'state_id')
  int stateId;

  @JsonKey(name: 'country_id')
  int countryId;

  @JsonKey(name: "country")
  CountryModel country;

  String name;

  StateModel({this.name, this.stateId, this.countryId});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
