import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasuraexample/src/home/home_module.dart';
import 'package:hasuraexample/src/home/home_repository.dart';
import 'package:hasuraexample/src/models/country_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  var _repository = HomeModule.to.getDependency<HomeRepository>();

  Future<List<Country>> getCountries() async {
    List<dynamic> countries = await _repository.getCountries();
    _countriesController.sink.add(countries);
    return countries;
  }

  var _countriesController = BehaviorSubject<List<Country>>();
  Observable<List<Country>> get outCountries => _countriesController.stream;

  @override
  void dispose() {
    _countriesController.close();
    super.dispose();
  }
}
