import 'package:flutter/material.dart';

class DefaultView extends StatefulWidget {
  final RouteSettings settings;

  DefaultView({this.settings});

  @override
  _DefaultViewState createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${widget.settings.name}'),
      ),
    );
  }
}
