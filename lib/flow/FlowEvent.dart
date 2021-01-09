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
