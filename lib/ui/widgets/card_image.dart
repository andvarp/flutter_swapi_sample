import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String tag;

  final GestureTapCallback onTap;

  CardImage({
    this.label,
    this.imageUrl,
    this.tag,
    this.onTap,
  }) : assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${label[0].toUpperCase()}${label.substring(1)}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: <Color>[
                              Colors.black87,
                              Colors.black45,
                              Colors.black.withAlpha(0),
                            ],
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.amber,
                              width: 3.0,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  ),
                ),
              ),
            )
          ],
          alignment: AlignmentDirectional.bottomCenter,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
      ),
    );
  }
}
