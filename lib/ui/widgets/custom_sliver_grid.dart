import 'package:flutter/material.dart';

class CustomSliverGrid extends StatefulWidget {
  final SliverChildBuilderDelegate childBuilderDelegate;
  CustomSliverGrid({this.childBuilderDelegate})
      : assert(childBuilderDelegate != null);

  @override
  _CustomSliverGridState createState() => _CustomSliverGridState();
}

class _CustomSliverGridState extends State<CustomSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(2),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        delegate: widget.childBuilderDelegate,
      ),
    );
  }
}
