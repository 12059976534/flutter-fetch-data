import 'mservice.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  static Future<List<Data>> getData() async {
    List<Data> listdata = [];
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Listuser responData = Listuser.fromjson(json);
      // print(json["data"]);
      responData.data.forEach((item) {
        // print(item);
        listdata.add(item);
      });
      // print(listdata);
      return listdata;
    }

    return listdata;
  }
}
