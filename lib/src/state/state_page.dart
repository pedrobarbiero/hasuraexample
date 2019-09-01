import 'package:flutter/material.dart';
import 'package:hasuraexample/src/home/home_module.dart';
import 'package:hasuraexample/src/models/country_model.dart';
import 'package:hasuraexample/src/models/state_model.dart';
import 'package:hasuraexample/src/state/add_state_page.dart';
import 'package:hasuraexample/src/state/state_bloc.dart';

class StatePage extends StatefulWidget {
  final CountryModel country;
  StatePage(this.country);

  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  var _bloc = HomeModule.to.getBloc<StateBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State"),
      ),
      body: ListView.builder(
        itemCount: widget.country.states.length,
        itemBuilder: (context, index) {
          StateModel state = widget.country.states[index];
          return Dismissible(
              key: Key(state.stateId.toString()),
              onDismissed: (direction) async {
                int affectedRows = await _bloc.remove(state.stateId);
                if (affectedRows > 0) widget.country.states.remove(state);
              },
              child: ListTile(
                title: Text(state.name),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var state = await Navigator.push<StateModel>(
              context,
              MaterialPageRoute(
                  builder: (context) => AddStatePage(widget.country)));
          if (state != null) widget.country.states.add(state);
        },
      ),
    );
  }
}
