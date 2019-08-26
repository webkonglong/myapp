import 'dart:convert';
import 'dart:io';

typedef void Callback(arg);

class Ajax {
  void get(String api, Map<String, String> data, Callback success) async {
    var url = "https://api.zhetaoke.com:10003/api/$api";

    data.forEach((key, value) {
      url += url.contains("?") ? "&" : "?";
      url += "$key=$value";
    });

    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var result = jsonDecode(json);
        success(result);
      } else {
        print("server error");
        print(url);
        print("11");
      }
    } catch (exception) {
      print("server error");
      print(url);
      print("22");
      print(exception);
    }
  }
}

var ajax = new Ajax();