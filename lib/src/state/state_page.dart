import 'package:flutter/material.dart';
import 'package:hasuraexample/src/models/country_model.dart';
import 'package:hasuraexample/src/state/add_state_page.dart';

class StatePage extends StatefulWidget {
  final CountryModel country;
  StatePage(this.country);

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State"),
      ),
      body: ListView.builder(
        itemCount: widget.country.states.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.country.states[index].name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddStatePage(widget.country)));
        },
      ),
    );
  }
}
