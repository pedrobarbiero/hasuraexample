import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasuraexample/src/models/country_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect connection;

  HomeRepository(this.connection);

  Future<List<Country>> getCountries() async {
    String qry = """ 
    {
      countries{
        country_id
        name
      }
    }
    """;

    var result = await connection.query(qry);
    var dynamics = result["data"]["countries"]
        .map((item) => Country.fromJson(item))
        .toList();

    var countries = List<Country>();
    for (var din in dynamics) {
      countries.add(din as Country);
    }
    return countries;
  }

  @override
  void dispose() {}
}
