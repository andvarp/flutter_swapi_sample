import 'package:flutter/material.dart';
import 'package:swapi_client/swapi_client.dart';

class PeopleDetailView extends StatefulWidget {
  final StarWarsPerson person;

  PeopleDetailView({this.person});

  @override
  _PeopleDetailViewState createState() => _PeopleDetailViewState();
}

class _PeopleDetailViewState extends State<PeopleDetailView> {
  @override
  Widget build(BuildContext context) {
    assert(widget.person != null);

    return Scaffold(
      body: Builder(
        builder: (ctx) => buildView(),
      ),
    );
  }

  Widget buildView() {
    return Text(widget.person.name);
  }
}
