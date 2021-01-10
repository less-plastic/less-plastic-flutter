import 'package:http/http.dart' as http;

class NetworkUtils {
  static bool isValidResponse(http.Response response) =>
      [200, 202, 204].contains(response.statusCode);
}
