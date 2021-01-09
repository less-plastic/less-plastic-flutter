import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_plastic/ui/HomeBloc.dart';

import 'ui/Home.dart';

class Routes {
  static const String HOME = '/';
}

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<HomeBloc>(
                  create: (_) => HomeBloc(),
                  child: Home(
                    title: "Title",
                  ),
                ));
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
