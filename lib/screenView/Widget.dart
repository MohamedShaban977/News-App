import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/screenView/Article_View.dart';
import 'package:news_flutter/screenView/CategoryAit.dart';

// ignore: non_constant_identifier_names
Widget MyAppBar() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Flutter',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Text(
          ' News',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}

class CategoryWidget extends StatelessWidget {
  final String categoryName, imageCategory;

  CategoryWidget({this.categoryName, this.imageCategory});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNewsView(
                      categoryName: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, top: 5),
        padding: EdgeInsets.all(5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageCategory,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  final String urlImageNews, title, desc, postUrlArt;

  NewsWidget(
      {@required this.urlImageNews,
      @required this.title,
      @required this.desc,
      @required this.postUrlArt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              url: postUrlArt,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: urlImageNews),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              desc,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CategoryNewsWidget extends StatelessWidget {
  final String urlImageNews, title, desc, postUrlArt;

  CategoryNewsWidget(
      {@required this.urlImageNews,
      @required this.title,
      @required this.desc,
      @required this.postUrlArt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              url: postUrlArt,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: urlImageNews),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                desc,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 5,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
