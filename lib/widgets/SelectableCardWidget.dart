import 'package:flutter/material.dart';

class SelectableCardWidget extends StatelessWidget {
  final String text;
  final MainAxisAlignment horizontalAlign;
  static const LEFT = MainAxisAlignment.start;
  static const RIGHT = MainAxisAlignment.end;

  SelectableCardWidget({this.text, this.horizontalAlign});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: this.horizontalAlign, children: <Widget>[
      Card(
          child: new InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(this.text),
              )))
    ]);
  }
}
