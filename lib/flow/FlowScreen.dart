import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_plastic/flow/FlowEvent.dart';

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
        body: BlocBuilder<FlowBloc, FlowState>(builder: (context, state) {
          if (state is StepFlowState) {
            return Text(state.step.text);
          } else {
            return FlatButton(
              onPressed: start,
              child: Text("Premimi"),
            );
          }
        }));
  }

  void start() {
    flowBloc.add(StartingFlowEvent());
  }
}
