import 'package:bloc/bloc.dart';
import 'package:less_plastic/flow/FlowEvent.dart';
import 'package:less_plastic/flow/FlowState.dart';
import 'package:network/flow/FlowRepository.dart';

class FlowBloc extends Bloc<FlowEvent, FlowState> {
  final FlowRepository flowRepository;

  FlowBloc({this.flowRepository}) : super(null);

  @override
  Stream<FlowState> mapEventToState(FlowEvent event) async* {
    if (event is StartingFlowEvent) {
      var session = await flowRepository.createSession();
      yield StepFlowState(step: session.step);
    } else {
      //TODO change
      yield null;
    }
  }
}
