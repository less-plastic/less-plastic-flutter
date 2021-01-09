import 'package:network/model/Session.dart';

abstract class FlowRepository {
  Future<Session> createSession();

  Future<Session> getSession(String sessionid);

  void updateSession(String sessionid, Map<String, Object> params);
}
