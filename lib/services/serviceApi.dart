import 'package:exp/models/news.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ServiceApi {
  const ServiceApi();

  //Register
  static Future register({required String username, required String password, required String name, required String tel, required String email}) async{
    final url = Uri.https('pro-account-api.dev-asha.com', '/api/register');
    final response = await http.post(url, body: {
      "username": username,
      "password": password,
      "name": name,
      "email": email,
      "tel": tel
    });

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data;
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //Login
  static Future login({required String username, required String password}) async{
    final url = Uri.https('pro-account-api.dev-asha.com', '/api/login');
    final response = await http.post(url, body: {
      "username": username,
      "password": password,
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      return data;
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
  

  //get News
  static Future<List<News>> getNews() async{
    final url = Uri.https('pro-account-api.dev-asha.com', '/api/get_news');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data['data'] as List;
      return list.map((e) => News.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //get News by Id 
  static Future<News> getNewsById({required int id}) async{
    final url = Uri.https('pro-account-api.dev-asha.com', '/api/get_news_by_id/${id}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final resdata = convert.jsonDecode(response.body);
      return News.fromJson(resdata['data']);
    } else {
      final resdata = convert.jsonDecode(response.body);
      throw Exception(resdata['message']);
    }
  }


}