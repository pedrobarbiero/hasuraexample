import 'package:flutter/material.dart';
import 'package:hasuraexample/src/app_module.dart';
import 'package:hasuraexample/src/models/country_model.dart';
import 'package:hasuraexample/src/state/add_state_bloc.dart';

class AddStatePage extends StatefulWidget {
  final CountryModel country;  

  AddStatePage(this.country);
  @override
  _AddStatePageState createState() => _AddStatePageState();
}

class _AddStatePageState extends State<AddStatePage> {
  var _bloc = AppModule.to.getBloc<AddStateBloc>();

  @override
  void initState() {
    _bloc.setCountry(widget.country);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddState"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Name"),
              controller: _bloc.controllerName,
            ),
            RaisedButton(
                child: Text("Save"),
                onPressed: () async {
                  var state = await _bloc.create();                                  
                  Navigator.pop(context, state);
                })
          ],
        ),
      ),
    );
  }
}
