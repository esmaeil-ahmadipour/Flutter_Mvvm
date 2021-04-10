import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/news_article.dart';
import 'package:flutter_mvvm/services/web_services.dart';
import 'package:flutter_mvvm/viewModel/news_article_view_model.dart';

enum LoadingState { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingState loadingState = LoadingState.empty;

  List<NewsArticleViewModel> articleList = List<NewsArticleViewModel>();

  void topHeadlines() async {
    loadingState=LoadingState.searching;
    List<NewsArticle> _newsArticles = await WebServices().fetchTopHeadlines();
    this.articleList = _newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (this.articleList.isEmpty) {
      loadingState=LoadingState.empty;
    } else {
      loadingState=LoadingState.completed;

    }
  }
  notifyListeners();
}
