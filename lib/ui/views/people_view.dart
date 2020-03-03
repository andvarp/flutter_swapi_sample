import 'package:flutter/material.dart';
import 'package:flutter_swapi_sample/core/selectors/people.dart';
import 'package:flutter_swapi_sample/core/viewmodels/app_model.dart';
import 'package:flutter_swapi_sample/locator.dart';
import 'package:flutter_swapi_sample/ui/widgets/custom_sliver_app_bar.dart';
import 'package:swapi_client/swapi_client.dart';

final String title = 'People';

class PeopleView extends StatefulWidget {
  @override
  _PeopleViewState createState() => _PeopleViewState();
}

class _PeopleViewState extends State<PeopleView> {
  AppModel _model = locator<AppModel>();
  StarWarsCollection<StarWarsPerson> _people;

  Widget buildContent() {
    print('we have data');
    print(_people.results);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            title: title,
          ),
          SliverFillRemaining(
            child: Container(
              child: Text(
                _people.results.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getSelectorValues();
    return Scaffold(
      backgroundColor: Colors.black,
      body: buildContent(),
    );
  }

  void getSelectorValues() {
    _people = peopleSelector(_model);
  }
}
