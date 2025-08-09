import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsRepository {
  final String _baseUrl = 'https://newsapi.org/v2/everything';
  final String _apiKey = 'dc83b13a3f1b4379904fe133e7e63ff6';

  Future<List<NewsModel>> fetchNews() async {
    final Uri uri = Uri.parse('$_baseUrl?q=news&apiKey=$_apiKey');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List articles = data['articles'];
     
        return articles.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to Load News');
      }
    } catch (e) {
      throw Exception("Failed to load News $e");
    }
  }
}
