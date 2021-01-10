import 'package:equatable/equatable.dart';
import 'package:network/model/Step.dart';

abstract class FlowState extends Equatable {
  final String id;

  FlowState({this.id});

  @override
  List<Object> get props => [id];
}

abstract class StepFlowState extends FlowState {
  final Step step;

  StepFlowState({this.step}) : super(id: step.id);
}

class SelectionFlowState extends FlowState {
  final Step step;

  SelectionFlowState({this.step});
}

class LoadingFlowState extends FlowState {
  LoadingFlowState() : super(id: 'loading');
}
