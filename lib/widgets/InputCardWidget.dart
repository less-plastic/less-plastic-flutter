import 'package:flutter/material.dart';

class InputCardWidget extends StatefulWidget {
  final void Function(String data) onTap;

  InputCardWidget({this.onTap});

  @override
  State<StatefulWidget> createState() => _InputCardState(onTap: this.onTap);
}

class _InputCardState extends State<InputCardWidget> {
  final void Function(String data) onTap;
  final fieldController = TextEditingController();

  _InputCardState({this.onTap});

  @override
  void dispose() {
    fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 9,
          child: Card(
              child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                      controller: fieldController,
                      decoration: InputDecoration(border: InputBorder.none),
                      autofocus: true,
                      keyboardType: TextInputType.multiline,
                      maxLines: 1)))),
      Expanded(
          child: IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              this.onTap.call(fieldController.text);
            },
          ),
          flex: 1)
    ]);
  }
}
