import 'package:dio/dio.dart';
import 'dart:io';

import 'package:newshive/models/news_model.dart';

class NewsService {
  final baseUrl = "https://newsapi.org";
  final dio = Dio();

  Future<List<NewsModel>?> getNews() async {
    try {
      final response = await dio.get(
          "$baseUrl/v2/top-headlines?sources=techcrunch&apiKey=040590e58b044b2f923e8b1adbe41c15");

      if (response.statusCode == HttpStatus.ok) {
        List data = response.data["articles"];
        List<NewsModel> news =
            data.map((news) => NewsModel.fromJson(news)).toList();

        return news;
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
