import 'package:flutter/material.dart';
import 'package:news_app/auth/google_signin.dart';
import 'package:news_app/models/api/news_api.dart';
import 'package:news_app/models/api/news_data.dart';
import 'package:news_app/models/providers/categories_provider.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:news_app/widgets/app_drawer.dart';
import 'package:news_app/widgets/blog_cards.dart';

import 'package:news_app/screens/categories_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: deprecated_member_use
  List<NewsData> articles = List<NewsData>();

  bool _loading = true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();

    getNews();
  }

  Widget build(BuildContext context) {
    final itemsData = Provider.of<CategoryItems>(context);
    final items = itemsData.appCategories;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                signOutGoogle();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (ctx) => SplashView()),
                  (Route<dynamic> route) => false,
                );
              })
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: "World",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: const <TextSpan>[
                  TextSpan(
                      text: "News",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ))
                ])),
          ],
        ),
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (ctx, index) =>
                              ChangeNotifierProvider.value(
                            value: items[index],
                            child: NewsCategories(),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return BlogTile(
                                  url: articles[index].url,
                                  imageUrl: articles[index].urlToImage,
                                  title: articles[index].title,
                                  description: articles[index].description);
                            }),
                      )
                    ],
                  ),
                ),
              ),
      ),
      // drawer: Drawer(
      //   child: DrawerWidget(),
      // ),
    );
  }
}
