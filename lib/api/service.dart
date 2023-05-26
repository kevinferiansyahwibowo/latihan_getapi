import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latihan_getapi/model/user.dart';

class ApiService {
  static const String apiUrl = 'https://reqres.in/api/users?per_page=12';
  Future<UserResponse> userData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mendapatkan data');
    }
  }
}
