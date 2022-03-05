import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpWrapper{

  Future<String?> getPlayer() async {
    var url =
    Uri.https('playform-new-staging.herokuapp.com', '/api/v2/players/me', {});


    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {
      "X-Auth-Token": "YRqMVxNxLaFZhHMehDA73V17"
    });

    if (response.statusCode == 200) {
      // var jsonResponse =
      // convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var itemCount = jsonResponse['totalItems'];
      print('response: ${response.body}.');
      return response.body;
    }
      print('Request failed with status: ${response.statusCode}.');
      return null;
  }
}