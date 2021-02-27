import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_flutter/controller/CategoryData.dart';
import 'package:news_flutter/controller/NewsArticles.dart';
import 'package:news_flutter/models/ArticlesModels.dart';
import 'package:news_flutter/models/CategoryModels.dart';
import 'package:news_flutter/screenView/Widget.dart';

import 'Article_View.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  List<CategoryModels> category = new List<CategoryModels>();
  List<ArticlesModels> articles = new List<ArticlesModels>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = getCategory();
    getNews();
  }

  Future<void> getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var orientation;
    return Scaffold(
      appBar: AppBar(title: MyAppBar()),
      //List Category
      body: _loading

          ///Loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView(
              shrinkWrap: true,
              children: [
                /// Category.......
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          categoryName: category[index].categoryName,
                          imageCategory: category[index].urlImageCategory,
                        );
                      }),
                ),

                ///News.....
                // Expanded(
                //   child:
                //   Container(
                //       child: ListView.separated(
                //         itemCount: articles.length,
                //         shrinkWrap: true,
                //         physics: ScrollPhysics(),
                //         itemBuilder: (context, index) {
                //           return BuildArtWidget(article: articles[index]);
                //         },
                //         separatorBuilder: (BuildContext context, int index) =>
                //             Divider(
                //           thickness: 10,
                //
                //           // color: Colors.red,
                //         ),
                //       ),
                //   ),
                //       child:
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StaggeredGridView.countBuilder(
                      itemCount: articles.length,
                      crossAxisCount: 2,
                      shrinkWrap: true,

                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BuildArtWidget(article: articles[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),

                      // mainAxisSpacing: 8,
                      // crossAxisSpacing: 1,
                    ),
                  ),
                ),

              ],
            ),
    );
  }
}

class BuildArtWidget extends StatelessWidget {
  const BuildArtWidget({
    @required this.article,
  });

  final ArticlesModels article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(url: article.url),
          ),
        );
      },
      child: Container(
        // margin: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage,
                  height: 200,


                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10),
              Text(
                article.title,
                textDirection: TextDirection.rtl,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              // SizedBox(height: 10),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     article.description,
              //     textDirection: TextDirection.rtl,
              //     style: TextStyle(
              //       color: Colors.black54,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// NewsWidget(
//                               title: articles[index].title,
//                               desc: articles[index].description,
//                               urlImageNews: articles[index].urlToImage,
//                               postUrlArt: articles[index].url,
//                             );
