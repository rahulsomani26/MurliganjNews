import 'package:MurliganjNews/helper/data.dart';
import 'package:MurliganjNews/helper/news.dart';
import 'package:MurliganjNews/models/article_model.dart';
import 'package:MurliganjNews/models/category_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  void getNews() async {
    News newsClass = News();
    await newsClass.getBusinessNews();
    print(newsClass.getBusinessNews());
    articles = newsClass.news;

    setState(() {
      print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^666');
      print(articles.length);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Murliganj',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : new SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 70,

                      /// categories

                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageURL: categories[index].imageURL,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),

                    ///blogs///

                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imgUrl: articles[index].urlToImage,
                            title: articles[index].title,
                            description: articles[index].description,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageURL;
  final categoryName;

  const CategoryTile({Key key, this.imageURL, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Clicked");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(right: 10),
        height: 90,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageURL,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 80,
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Mont',
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl, title, description;

  const BlogTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imgUrl),
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
