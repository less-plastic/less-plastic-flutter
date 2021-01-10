import 'package:bloc/bloc.dart';
import 'package:less_plastic/flow/FlowEvent.dart';
import 'package:less_plastic/flow/FlowState.dart';
import 'package:network/flow/FlowRepository.dart';

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

      // TODO add type check
      yield SelectionFlowState(step: session.step);
    } else if (event is SelectionFlowEvent) {
      await flowRepository.updateSession(sessionsId, {
        "questionStepId": event.questionId,
        "answerStepId": event.selectedId
      });
      var session = await flowRepository.getSession(sessionsId);

      // TODO add type check
      yield SelectionFlowState(step: session.step);
    } else {
      //TODO change
      yield null;
    }
  }
}
