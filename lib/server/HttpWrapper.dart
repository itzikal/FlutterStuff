import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_test_drive/model/Player.dart';
import 'package:flutter_test_drive/model/VideoResults.dart';
import 'package:flutter_test_drive/server/ServerResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HttpWrapper{

  Future<VideoResults?> getVideos() async{
    // https://playform-new-staging.herokuapp.com/api/v2/players/me/videos?locale=es&per_page=99
    var url =
    Uri.https('playform-new-staging.herokuapp.com', '/api/v2/players/me/videos', {});


    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {
      "X-Auth-Token": "YRqMVxNxLaFZhHMehDA73V17"
    });
    if (response.statusCode == 200) {
      // var jsonResponse =
      // convert.jsonDecode(response.body) as Map<String, dynamic>;
      // var itemCount = jsonResponse['totalItems'];
      print('response: ${response.body}');
      var result = VideoResults.fromJson(convert.jsonDecode(response.body));
      print("result data: ${result.data?? "Empty"}");
      return result;
      // return ServerResponse<Player?>.fromJson(json);Player.fromJson(response.body);
    }
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }

  // Future<Player?> getPlayer() async {
  //   var url =
  //   Uri.https('playform-new-staging.herokuapp.com', '/api/v2/players/me', {});
  //
  //
  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.get(url, headers: {
  //     "X-Auth-Token": "YRqMVxNxLaFZhHMehDA73V17"
  //   });
  //
  //   if (response.statusCode == 200) {
  //     // var jsonResponse =
  //     // convert.jsonDecode(response.body) as Map<String, dynamic>;
  //     // var itemCount = jsonResponse['totalItems'];
  //     print('response: ${response.body}');
  //     var result = JsonMapper.deserialize<ServerResponse<String>>(response.body);
  //     print("result data: ${result?.data?? "Empty"}");
  //     // return ServerResponse<Player?>.fromJson(json);Player.fromJson(response.body);
  //   }
  //     print('Request failed with status: ${response.statusCode}.');
  //     return null;
  // }
}