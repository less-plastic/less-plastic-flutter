import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState("id"));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield HomeState("id");
  }
}

class HomeEvent extends Equatable {
  final String id;

  HomeEvent(this.id);

  @override
  List<Object> get props => [id];
}

class HomeState extends Equatable {
  final String id;

  HomeState(this.id);

  @override
  List<Object> get props => [id];
}
