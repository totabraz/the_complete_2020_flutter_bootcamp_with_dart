import 'dart:convert';

import 'package:http/http.dart' as http;

const apikey = "e59964ef00d45dafb668b3bb34f98530";

class NetworkHelper {
  String url;
  NetworkHelper({this.url});
  Future getData() async {
    http.Response response = await http.get(this.url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
