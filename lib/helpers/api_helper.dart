import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jhoan_mesa_8_2021_2_p1/models/country.dart';
import 'package:jhoan_mesa_8_2021_2_p1/models/response.dart';
import 'constans.dart';

class ApiHelper {
  static Future<Response> getCountries() async {
    var url = Uri.parse(Constans.apiUrl);
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(message: body);
    }

    List<Country> list = [];
    var decodedJson = jsonDecode(body);
    if (decodedJson != null) {
      for (var item in decodedJson) {
        list.add(Country.fromJson(item));
      }
    }

    return Response(result: list);
  }
}
