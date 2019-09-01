import 'package:flutter/material.dart';
import 'package:hasuraexample/src/home/home_bloc.dart';
import 'package:hasuraexample/src/models/country_model.dart';
import 'package:hasuraexample/src/state/state_page.dart';

import 'home_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    _bloc.getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: StreamBuilder<List<CountryModel>>(
        stream: _bloc.outCountries,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return ListView(
              children: snapshot.data.map((country) {
            return ListTile(
              title: Text(country.name),
              trailing: Icon(Icons.arrow_right),
              onTap: () {                
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StatePage(country)));
              },
            );
          }).toList());
        },
      ),
    );
  }
}
