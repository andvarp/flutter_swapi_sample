import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swapi_sample/core/enums/view_state.dart';
import 'package:flutter_swapi_sample/core/selectors/people_selectors.dart';
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
  ViewState _state;
  StarWarsCollection<StarWarsPerson> _people;
  ScrollController _controller = ScrollController();

  RegExp exp = new RegExp(r"(?<=page\=).*");

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      double triggerHeight = _controller.position.maxScrollExtent * .5;

      if (_controller.offset >= triggerHeight &&
          _state == ViewState.Idle &&
          _people.next != null) {
        String page = exp.firstMatch(_people.next).group(0);
        if (page.length > 0) {
          _model.getPeople(page: int.parse(page));
        }
      }
    });
  }

  Widget buildContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          CustomSliverAppBar(
            title: title,
            showProgressIndicator: _state == ViewState.Busy,
//            showProgressIndicator: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return listItem(_people.results[index].name);
              },
              childCount: _people.results.length,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getSelectorValues();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) => buildContent(),
      ),
    );
  }

  void getSelectorValues() {
    _state = peopleModelStateSelector(_model);
    _people = peopleSelector(_model);
  }

  Widget listItem(String title) => Container(
        height: 100.0,
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
