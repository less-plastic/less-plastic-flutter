import 'package:flutter/material.dart';

class BubbleCardWidget extends StatelessWidget {
  final String text;
  final MainAxisAlignment horizontalAlign;

  static const LEFT = MainAxisAlignment.start;
  static const RIGHT = MainAxisAlignment.end;

  BubbleCardWidget({@required this.text, this.horizontalAlign = LEFT});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: this.horizontalAlign, children: <Widget>[
      Card(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(this.text),
      ))
    ]);
  }
}
