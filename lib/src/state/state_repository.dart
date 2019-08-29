import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasuraexample/src/models/state_model.dart';

class StateRepository extends Disposable {
  final HasuraConnect connection;

  StateRepository(this.connection);

  Future<StateModel> createState(StateModel state) async {
    var query = """
      mutation createState(\$name:String!, \$country_id:Int) {
        insert_states(objects: {name: \$name, country_id: \$country_id}) {
          returning {
            state_id
          }
        }
      }
    """;
    var data = await connection.mutation(query, variables: {"name": state.name, "country_id": state.countryId});
    var id = data["data"]["insert_states"]["returning"][0]["state_id"];

    return StateModel(stateId: id, name: state.name);
  }

  @override
  void dispose() {}
}
