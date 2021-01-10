import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      'assets/loading.json',
      width: 200,
      height: 200,
      fit: BoxFit.fill,
    ));
  }
}
