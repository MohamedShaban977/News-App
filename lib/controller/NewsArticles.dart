import 'dart:convert';
import 'package:news_flutter/models/ArticlesModels.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticlesModels> news = [];
  Future<void> getNews() async {
    String url = 'https://newsapi.org/v2/top-headlines?country=eg&apiKey=39acba8cda5b46b38df7ce6aafe853cb';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((index) {
        if (index['urlToImage'] != null && index['description'] != null) {
          ArticlesModels articlesModels = new ArticlesModels(
            title: index['title'],
            author: index['author'],
            description: index['description'],
            url: index['url'],
            urlToImage: index['urlToImage'],
            publishedAt: DateTime.parse(index['publishedAt']),
            content: index['content'],
          );
          news.add(articlesModels);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticlesModels> news = [];
  Future<void> getNews(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=39acba8cda5b46b38df7ce6aafe853cb';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((index) {
        if (index['urlToImage'] != null && index['description'] != null) {
          ArticlesModels articlesModels = new ArticlesModels(
            title: index['title'],
            author: index['author'],
            description: index['description'],
            url: index['url'],
            urlToImage: index['urlToImage'],
            publishedAt: DateTime.parse(index['publishedAt']),
            content: index['content'],
          );
          news.add(articlesModels);
        }
      });
    }
  }
}
