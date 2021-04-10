import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mvvm/viewModel/news_article_view_model.dart';
import 'package:flutter_mvvm/widgets/circle_image.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsDetailsScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: new BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  shape: BoxShape.circle,
                ),
                child: new Icon(
                  Icons.message,
                  color:
                      Theme.of(context).dividerColor.computeLuminance() >= 0.5
                          ? Colors.black
                          : Colors.white,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth:150
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Author',style: TextStyle(color: Colors.grey),),
                    Text(article.author ?? 'Undefined',overflow: TextOverflow.ellipsis,)],
                ),
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Divider(color: Theme.of(context).dividerColor,thickness: 20,height: 80,),
                  Text('Headlines' , style: TextStyle(color: Colors.white,fontSize: 14),)
                ],
              ),
              Text(article.title,style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text(article.publishedAt,style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold,color: Colors.grey,),),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.width/2,
                child: CircleImage(imageUrl: article.urlToImage,),
              ),
              SizedBox(height: 30,),
              Text(article.description,style: TextStyle(fontSize: 16 ,wordSpacing: 1.5),),
              SizedBox(height: 15,),

            ],
          ),
        ),
      ),
    );
  }
}
