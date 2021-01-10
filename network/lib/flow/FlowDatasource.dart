import 'dart:convert';
import 'package:network/flow/FlowRepository.dart';
import 'package:network/model/Session.dart';
import 'package:http/http.dart' as http;
import 'package:network/utils/NetworkUtils.dart';

import '../ApiConfiguration.dart';

class FlowDatasource implements FlowRepository {
  final ApiConfiguration configuration;

  FlowDatasource({this.configuration});

  @override
  Future<Session> createSession() async {
    return handleResponse(await http.post('${configuration.HOST}flow'));
  }

  @override
  Future<Session> getSession(String sessionid) async {
    return handleResponse(
        await http.get('${configuration.HOST}flow/$sessionid'));
  }

  @override
  Future<void> updateSession(
      String sessionid, Map<String, Object> params) async {
    var response =
        await http.patch('${configuration.HOST}flow/$sessionid', body: params);
    if (!NetworkUtils.isValidResponse(response)) {
      throw Exception('Failed to fetch data');
    }
  }

  Session handleResponse(http.Response response) {
    if (NetworkUtils.isValidResponse(response)) {
      return Session.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
