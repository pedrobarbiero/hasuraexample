import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasuraexample/src/models/country_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect connection;

  HomeRepository(this.connection);

  Future<List<CountryModel>> getCountries() async {
    String qry = """ 
    {
      countries{
        country_id
        name
        states{
          name
        }
      }
    }
    """;

    var result = await connection.query(qry);
    var dynamics = result["data"]["countries"]
        .map((item) => CountryModel.fromJson(item))
        .toList();

    var countries = List<CountryModel>();
    for (var din in dynamics) {
      countries.add(din as CountryModel);
    }
    return countries;
  }

  @override
  void dispose() {}
}
