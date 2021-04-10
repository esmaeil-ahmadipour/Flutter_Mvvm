import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/viewModel/news_article_list_view_model.dart';
import 'package:flutter_mvvm/widgets/landscape/news_screen_landscape.dart';
import 'package:flutter_mvvm/widgets/news_grid.dart';
import 'package:flutter_mvvm/widgets/portrait/news_screen_portrait..dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var articleListViewModel = Provider.of<NewsArticleListViewModel>(context);
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.landscape
          ? buildScaffoldLandscape(articleListViewModel)
          : buildScaffoldPortrait(articleListViewModel);
    });
  }
}
