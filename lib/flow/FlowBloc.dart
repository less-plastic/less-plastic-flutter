import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:less_plastic/flow/FlowEvent.dart';
import 'package:less_plastic/flow/FlowState.dart';
import 'package:network/flow/FlowRepository.dart';
import 'package:network/model/Step.dart';

class FlowBloc extends Bloc<FlowEvent, FlowState> {
  final FlowRepository flowRepository;
  String sessionsId;

  FlowBloc({this.flowRepository}) : super(null);

  @override
  Stream<FlowState> mapEventToState(FlowEvent event) async* {
    yield LoadingFlowState();

    if (event is StartingFlowEvent) {
      var session = await flowRepository.createSession();
      sessionsId = session.sessionId;
      yield SelectionFlowState(step: session.step);
    } else if (event is UpdateFlowEvent) {
      await flowRepository.updateSession(sessionsId, {
        "currentStepId": event.questionId,
        "optionSelected": event.selectedId ?? '',
        "data": event.data ?? ''
      });
      var session = await flowRepository.getSession(sessionsId);

      // TODO add type check
      switch (session.step.type) {
        case StepType.selection:
          yield SelectionFlowState(step: session.step);
          break;

        case StepType.number:
          yield NumberInputFlowSate(step: session.step);
          break;

        default:
          yield SelectionFlowState(step: session.step);
          break;
      }
    } else {
      //TODO change
      yield null;
    }
  }
}
