import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSliverAppBar extends StatefulWidget {
  final String title;
  final showProgressIndicator;
  CustomSliverAppBar({this.title, this.showProgressIndicator});
  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .20;
    double width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: false,
      pinned: true,
      expandedHeight: height,
      bottom: PreferredSize(
        preferredSize: Size(width, 6.0),
        child: progressBarBuilder(),
      ),
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

  Widget progressBarBuilder() {
    if (widget.showProgressIndicator != null) {
      return widget.showProgressIndicator
          ? LinearProgressIndicator(
              backgroundColor: Colors.red[300],
              valueColor: new AlwaysStoppedAnimation<Color>(
                  Colors.red), //todo: onScroll mark progress
            )
          : Container(
              height: 6.0,
              color: Colors.red,
            );
    }
    return Container();
  }
}
