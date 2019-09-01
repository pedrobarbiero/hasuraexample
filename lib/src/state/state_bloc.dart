import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasuraexample/src/home/home_module.dart';
import 'package:hasuraexample/src/state/state_repository.dart';

class StateBloc extends BlocBase {
  var _repository = HomeModule.to.getDependency<StateRepository>();

  Future<int> remove(int id) async => await _repository.remove(id);

  @override
  void dispose() {
    super.dispose();
  }
}
