import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/screens/news_details_screen.dart';
import 'package:flutter_mvvm/viewModel/news_article_view_model.dart';
import 'package:flutter_mvvm/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articleList;

  NewsGrid({this.articleList});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => (GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.landscape ? 3 : 2),
        itemBuilder: (context, index) {
          var article = articleList[index];

          return GestureDetector(
            onTap: (){
              _showArticleDetails(context,article);
            },
            child: GridTile(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: CircleImage(
                  imageUrl: article.urlToImage,
                ),
              ),
              footer: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  article.title,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight:FontWeight.bold),
                ),
              ),
            ),
          );
        },
        itemCount: this.articleList.length,
      )),
    );
  }

  void _showArticleDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(context, MaterialPageRoute(builder: (_){
      return NewsDetailsScreen(article: article,);
    }));
  }
}
