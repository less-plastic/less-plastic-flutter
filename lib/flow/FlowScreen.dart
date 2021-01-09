import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_plastic/flow/FlowEvent.dart';
import 'package:less_plastic/widgets/BubbleCardWidget.dart';
import 'package:less_plastic/widgets/SelectableCardWidget.dart';

import 'FlowBloc.dart';
import 'FlowState.dart';

class FlowScreen extends StatelessWidget {
  FlowScreen({Key key}) : super(key: key);

  FlowBloc flowBloc;

  @override
  Widget build(BuildContext context) {
    flowBloc = BlocProvider.of<FlowBloc>(context);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("title"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: BlocBuilder<FlowBloc, FlowState>(builder: (context, state) {
              if (state is StepFlowState) {
                var widgets = <Widget>[
                  BubbleCardWidget(
                    text: state.step.text,
                    horizontalAlign: BubbleCardWidget.RIGHT,
                  )
                ];
                state.step.options.forEach((option) => widgets.add(
                    SelectableCardWidget(
                        text: option.text,
                        horizontalAlign: SelectableCardWidget.LEFT)));
                return Column(children: widgets);
              } else {
                return FlatButton(
                  onPressed: () {
                    flowBloc.add(StartingFlowEvent());
                  },
                  child: Text("Premimi"),
                );
              }
            })));
  }
}
