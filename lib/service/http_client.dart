import 'dart:convert';
import 'package:github_search/models/repositorie.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client httpClient = http.Client();

  static const BASE_URL = 'https://api.github.com';
  static const PER_PAGE = 10;

  static Future searchRepositories({String seachName, int page = 1}) async {
    var url = '$BASE_URL/search/repositories?q=$seachName&per_page=$PER_PAGE&page=$page';
    print(url);
    var response = await http.get(url);

    print('Response body: ${json.decode(utf8.decode(response.bodyBytes))}');
    final jsonData = utf8.decode(response.bodyBytes);
    final repositorie = repositorieFromJson(jsonData);
    return repositorie;
  }
}