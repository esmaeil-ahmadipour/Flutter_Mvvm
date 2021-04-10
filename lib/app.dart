import 'package:flutter/material.dart';
import 'package:flutter_mvvm/home.dart';
import 'package:flutter_mvvm/screens/news_screen.dart';
import 'package:flutter_mvvm/viewModel/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM News-App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NewsArticleListViewModel()),
        ],
        child: NewsScreen(),
      ),
    );
  }
}
