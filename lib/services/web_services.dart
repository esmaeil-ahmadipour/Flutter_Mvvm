import 'package:dio/dio.dart';
import 'package:flutter_mvvm/models/news_article.dart';

class WebServices {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String _url =
        'https://newsapi.org/v2/everything?q=apple&from=2021-04-09&to=2021-04-09&sortBy=popularity&apiKey=5d55ec5f4df343b59d031016c3a63de0';

    final _response = await dio.get(_url);

    if (_response.statusCode == 200) {
      final _result = _response.data;
      Iterable _list = _result['articles'];
      return _list.map((article) => NewsArticle.fromJson(article)).toList();
    }else{
      throw Exception('failed to get top headlines.');
    }
  }
}
