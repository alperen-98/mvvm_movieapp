import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<dynamic> getData(String url) async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw 'Error';
    }
  }
}
