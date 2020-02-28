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
    double height = MediaQuery.of(context).size.height * .20;
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: false,
      pinned: true,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://i.ytimg.com/vi/sEl8ldmTO4o/maxresdefault.jpg',
          fit: BoxFit.cover,
        ),
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
