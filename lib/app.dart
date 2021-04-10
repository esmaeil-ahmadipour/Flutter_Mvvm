import 'package:flutter/material.dart';
import 'package:flutter_mvvm/screens/news_screen.dart';
import 'package:flutter_mvvm/viewModel/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM News-App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefdfd),
        dividerColor: Color(0xffff8a30),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
            color: Color(0xfffefdfd),
            textTheme: TextTheme(title: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            actionsIconTheme: IconThemeData(color: Colors.black),

            elevation: 0),
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
