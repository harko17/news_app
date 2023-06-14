import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api_app/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle(String val) async {

//6fb3dd52db184b8590cdf280ccbf2d2c
    final queryParameters = {
      'country': 'in',
      'category': val,
      'apiKey': 'e850d66b9bcf46d89c79e32d2730cddb'
    };

    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
