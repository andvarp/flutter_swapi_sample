import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSliverAppBar extends StatefulWidget {
  final String title;
  CustomSliverAppBar({this.title});
  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: false,
      pinned: true,
      expandedHeight: height * 0.30,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'starwars',
            fontSize: 35.0,
            color: Colors.amber,
            height: 1,
          ),
        ),
      ),
    );
  }
}
