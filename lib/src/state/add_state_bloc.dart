import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:hasuraexample/src/home/home_module.dart';
import 'package:hasuraexample/src/models/country_model.dart';
import 'package:hasuraexample/src/models/state_model.dart';
import 'package:hasuraexample/src/state/state_repository.dart';

class AddStateBloc extends BlocBase {
  var controllerName = TextEditingController();
  var _repository = HomeModule.to.getDependency<StateRepository>();

  CountryModel _country;

  void setCountry(CountryModel value) => _country = value;

  Future<StateModel> create() async => _repository.createState(
      StateModel(name: controllerName.text, countryId: _country.countryId));

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }
}
