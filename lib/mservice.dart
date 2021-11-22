import 'package:http/http.dart' as http;
import 'dart:convert';

class Listuser {
  late int page, per_page, total, total_page;
  late List<Data> data;

  var total_pages;

  Listuser(
      {required this.page,
      required this.per_page,
      required this.total,
      required this.total_pages,
      required this.data});

  factory Listuser.fromjson(Map<String, dynamic> json) => Listuser(
      page: json["page"],
      per_page: json["per_page"],
      total: json["total"],
      total_pages: json["total_pages"],
      data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))));
}

class Data {
  late String email, first_name, last_name, avatar;
  late int id;

  Data(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      email: json["email"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      avatar: json["avatar"]);

  //service list off data
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
