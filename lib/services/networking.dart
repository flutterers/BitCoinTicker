import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../utilities/constants.dart';

class NetworkHelper {
  Future getHttpResponse(url) async {
    dynamic decodedData;

    http.Response response = await http.get(url);

    dynamic test;
    if (response.statusCode == 200) {
      //parse response
      var data = response.body;
      decodedData = jsonDecode(data);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
        print(response.reasonPhrase);
      }
    }
    if (kDebugMode) {
      print("url: $url");
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(test);
    }

    return decodedData;
  }
}
