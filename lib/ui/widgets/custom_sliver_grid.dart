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
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        delegate: widget.childBuilderDelegate,
      ),
    );
  }
}
