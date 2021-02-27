import 'package:flutter/material.dart';
import 'package:news_flutter/controller/NewsArticles.dart';
import 'package:news_flutter/models/ArticlesModels.dart';
import 'package:news_flutter/screenView/Widget.dart';

class CategoryNewsView extends StatefulWidget {
  final String categoryName;
  CategoryNewsView({this.categoryName});
  @override
  _CategoryNewsViewState createState() => _CategoryNewsViewState();
}

class _CategoryNewsViewState extends State<CategoryNewsView> {
  List<ArticlesModels> articles = new List<ArticlesModels>();

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.categoryName);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar(),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.category,
            ),
          ),
        ],
      ),
      body: _loading

          ///Loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ///News.....
                    Container(
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CategoryNewsWidget(
                              title: articles[index].title,
                              desc: articles[index].description,
                              urlImageNews: articles[index].urlToImage,
                              postUrlArt: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
