import 'package:client_app/client_app.dart';
import 'package:http/http.dart' as http;

class Service {
  static const Map<String, String> headers = {
    "Content-type": "application/json",
  };

  String _hostname() {
    if (Platform.isAndroid) return 'http://10.0.2.2:3000';
    return 'http://localhost:3000';
  }

  makeGetAllRequest() async {
    http.Response response = await http.get(_hostname());
    int statusCode = response.statusCode;
    String jsonString = response.body;
    print('Status: $statusCode, $jsonString');
  }

  makeGetOneRequest() async {
    int idToGet = 0;
    String url = '${_hostname()}/$idToGet';
    http.Response response = await http.get(url);
    int statusCode = response.statusCode;
    String jsonString = response.body;
    print('Status: $statusCode, $jsonString');
  }

  makePostRequest() async {
    String json = '{"fruit": "pear", "color": "green"}';
    http.Response response =
        await http.post(_hostname(), headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    print('Status: $statusCode, $body');
  }

  makePutRequest() async {
    int idToReplace = 0;
    String url = '${_hostname()}/$idToReplace';
    String json = '{"fruit": "watermellon", "color": "red and green"}';
    http.Response response = await http.put(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    print('Status: $statusCode, $body');
  }

  makePatchRequest() async {
    int idToUpdate = 0;
    String url = '${_hostname()}/$idToUpdate';
    String json = '{"color": "green"}';
    http.Response response =
        await http.patch(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    String body = response.body;
    print('Status: $statusCode, $body');
  }

  void makeDeleteRequest() async {
    int idToDelete = 0;
    String url = '${_hostname()}/$idToDelete';
    http.Response response = await http.delete(url);
    int statusCode = response.statusCode;
    String body = response.body;
    print('Status: $statusCode, $body');
  }
}
