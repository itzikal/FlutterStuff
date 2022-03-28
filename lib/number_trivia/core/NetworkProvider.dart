import 'package:http/http.dart' as http;

class NetworkProvider {
  final http.Client httpClient;

  NetworkProvider({required this.httpClient});

  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    return await http.get(url, headers: headers);
  }
}