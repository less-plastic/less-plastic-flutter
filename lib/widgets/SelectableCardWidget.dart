import 'package:flutter/material.dart';

class SelectableCardWidget extends StatelessWidget {
  final String text;
  final MainAxisAlignment horizontalAlign;
  final GestureTapCallback onTap;

  static const LEFT = MainAxisAlignment.start;
  static const RIGHT = MainAxisAlignment.end;

  SelectableCardWidget({@required this.text, this.onTap, this.horizontalAlign});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: this.horizontalAlign, children: <Widget>[
      Row(children: [
        Icon(Icons.check),
        Card(
            color: Colors.blue.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: new InkWell(
                onTap: this.onTap,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(this.text),
                )))
      ])
    ]);
  }
}
