import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/api/news_data.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsData> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=21193dd612dc4b91bf2f4a05bafe357b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          NewsData articles = NewsData(
            title: element["title"],
            description: element["description"],
            author: element["author"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );

          news.add(articles);
        }
      });
    }
  }
}

class CategoryApi {
  List<NewsData> news = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=21193dd612dc4b91bf2f4a05bafe357b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          NewsData articles = NewsData(
            title: element["title"],
            description: element["description"],
            author: element["author"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );

          news.add(articles);
        }
      });
    }
  }
}
