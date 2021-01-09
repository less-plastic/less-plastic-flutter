import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/ApiConfiguration.dart';
import 'package:network/flow/FlowDatasource.dart';

import 'flow/FlowBloc.dart';
import 'flow/FlowScreen.dart';

class Routes {
  static const String HOME = '/';
}

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<FlowBloc>(
                  create: (_) => FlowBloc(
                      flowRepository:
                          FlowDatasource(configuration: ApiConfiguration())),
                  child: FlowScreen(),
                ));
      default:
        return null;
    }
  }
}
