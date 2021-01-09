import 'Step.dart';

class Session {
  final String userId;
  final String currentStepId;
  final String sessionId;
  final Step step;

  Session({this.sessionId, this.currentStepId, this.userId, this.step});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      userId: json['userId'],
      currentStepId: json['currentStepId'],
      sessionId: json['sessionId'],
      step: Step.fromJson(json['step']),
    );
  }
}
