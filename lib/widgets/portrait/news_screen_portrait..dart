import 'package:flutter/material.dart';
import 'package:flutter_mvvm/viewModel/news_article_list_view_model.dart';
import 'package:flutter_mvvm/widgets/news_grid.dart';

Scaffold buildScaffoldPortrait(NewsArticleListViewModel articleListViewModel) {

  return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert,)
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text('NEWS',style: TextStyle(fontSize: 50),),
            ),
            Divider(height: 40.0,thickness: 8.0,indent: 30,endIndent: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 15,bottom: 15),
              child: Text('Headlines',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            ),
            Expanded(
                child: NewsGrid(
                  articleList: articleListViewModel.articleList,
                )),
          ],
        ),
      ));
}