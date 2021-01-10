import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_plastic/flow/FlowEvent.dart';
import 'package:less_plastic/widgets/BubbleCardWidget.dart';
import 'package:less_plastic/widgets/LoadingWidget.dart';
import 'package:less_plastic/widgets/SelectableCardWidget.dart';

import 'FlowBloc.dart';
import 'FlowState.dart';

class FlowScreen extends StatelessWidget {
  FlowScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Flow"),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: BlocBuilder<FlowBloc, FlowState>(builder: (context, state) {
              if (state is LoadingFlowState) {
                // Loading state
                return LoadingWidget();
              } else if (state is SelectionFlowState) {
                // Selection state
                var widgets = <Widget>[
                  BubbleCardWidget(
                    text: state.step.text,
                    horizontalAlign: BubbleCardWidget.RIGHT,
                  )
                ];
                state.step.options
                    .forEach((option) => widgets.add(SelectableCardWidget(
                        onTap: () {
                          BlocProvider.of<FlowBloc>(context).add(
                              SelectionFlowEvent(
                                  questionId: state.step.id,
                                  selectedId: option.id));
                        },
                        text: option.text,
                        horizontalAlign: SelectableCardWidget.LEFT)));
                return Column(children: widgets);
              } else {
                // Null
                return FlatButton(
                  onPressed: () {
                    BlocProvider.of<FlowBloc>(context).add(StartingFlowEvent());
                  },
                  child: Text("Start flow"),
                );
              }
            })));
  }
}
