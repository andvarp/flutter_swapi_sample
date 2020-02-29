import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool showLoading;

  Loading({this.showLoading = false});

  @override
  Widget build(BuildContext context) {
    if (!showLoading) return null;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
