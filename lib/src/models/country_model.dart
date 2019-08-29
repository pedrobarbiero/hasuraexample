import 'package:hasuraexample/src/models/state_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  @JsonKey(name: 'country_id')
  int countryId;
  String name;
  List<StateModel> states;

  CountryModel({
    this.countryId,
    this.name
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
