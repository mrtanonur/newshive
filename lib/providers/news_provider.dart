import 'package:flutter/material.dart';
import 'package:newshive/models/news_model.dart';
import 'package:newshive/services/news_service.dart';

enum NewsState {
  initial,
  loading,
  loaded,
  error,
}

class NewsProvider extends ChangeNotifier {
  NewsState state = NewsState.initial;
  final NewsService _newsService = NewsService();
  int? newsIndex;
  List<NewsModel> news = [];
  List<NewsModel> filteredNews = [];

  String searchText = "";

  Future<List<NewsModel>?> getNews() async {
    if (state != NewsState.loaded) {
      state = NewsState.loading;
      notifyListeners();
      final response = await _newsService.getNews();
      if (response != null) {
        state = NewsState.loaded;
        news = response;
        notifyListeners();
        return news;
      } else {
        state = NewsState.error;
      }
      notifyListeners();
      return null;
    }
    return null;
  }

  void reset() {
    searchText = "";

    notifyListeners();
  }

  void filterNews(String value) {
    searchText = value;
    filteredNews = news
        .where((news) =>
            news.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
