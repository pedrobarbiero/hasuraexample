import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: 'country_id')
  int countryId;

  String name;

  Country({
    this.countryId,
    this.name
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
