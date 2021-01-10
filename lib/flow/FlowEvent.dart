import 'package:equatable/equatable.dart';

abstract class FlowEvent extends Equatable {
  final String id;

  FlowEvent({this.id});

  @override
  List<Object> get props => [id];
}

class StartingFlowEvent extends FlowEvent {
  StartingFlowEvent() : super(id: "starting");
}

class SelectionFlowEvent extends FlowEvent {
  final String questionId;
  final String selectedId;
  final dynamic data;
  SelectionFlowEvent({this.questionId, this.selectedId, this.data})
      : super(id: selectedId);
}
