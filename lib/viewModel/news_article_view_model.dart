import 'package:flutter_mvvm/models/news_article.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;


  String get url {
    return _newsArticle.url;
  }

  String get title {
    return _newsArticle.title;
  }

  String get author {
    return _newsArticle.author;
  }

  String get content {
    return _newsArticle.content;
  }

  String get description {
    return _newsArticle.description;
  }

  String get publishedAt {
    return _newsArticle.publishedAt;
  }

  String get urlToImage {
    return _newsArticle.urlToImage;
  }
}
