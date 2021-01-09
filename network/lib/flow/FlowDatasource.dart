import 'dart:convert';
import 'package:network/flow/FlowRepository.dart';
import 'package:network/model/Session.dart';
import 'package:http/http.dart' as http;

import '../ApiConfiguration.dart';

class FlowDatasource implements FlowRepository {
  final ApiConfiguration configuration;

  FlowDatasource({this.configuration});

  @override
  Future<Session> createSession() async {
    return handleResponse(await http.post(configuration.HOST + 'flow'));
  }

  @override
  Future<Session> getSession(String sessionid) async {
    return handleResponse(await http.get(configuration.HOST + 'flow'));
  }

  @override
  void updateSession(String sessionid, Map<String, Object> params) async {
    var response = await http.patch(configuration.HOST + 'flow');
    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }
  }

  Session handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Session.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
