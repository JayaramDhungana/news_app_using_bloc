import 'dart:convert';
import 'dart:developer';

import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class CategoryWiseRepository {
  String category;

  CategoryWiseRepository({required this.category});

  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String _apiKey = 'dc83b13a3f1b4379904fe133e7e63ff6';

  Future<List<NewsModel>> fetchCategoryWiseNews() async {
    // final Uri uri=Uri.parse("$_baseUrl?category=$category&$_apiKey");

    final Uri uri = Uri.parse(
      "https://newsapi.org/v2/top-headlines?category=$category&apiKey=dc83b13a3f1b4379904fe133e7e63ff6",
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List article = data['articles'];
        return article.map((json) => NewsModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to Load Data");
      }
    } catch (e) {
      throw Exception("The Error is $e");
    }
  }
}
