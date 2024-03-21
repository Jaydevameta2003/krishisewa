import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart%20' hide Get;
import 'package:http/http.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/navigation_menu.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/news/consts.dart';
import 'package:krishisewa/src/features/authentication/screens/home_screen/news/model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsHome extends StatefulWidget {
  const NewsHome({super.key});

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  List<Article> newsModelList = <Article>[];

  bool isLoading = true;
  void getNews() async {
    String url = "https://newsapi.org/v2/everything?q=agriculture+india&domains=thehindu.com,indiatoday.in,timesofindia.indiatimes.com,ndtv.com,economictimes.indiatimes.com,livemint.com&apiKey=$NEWS_API_KEY";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        Article newsQueryModel = Article.fromMap(element);
        newsModelList.add(newsQueryModel);
      });
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.off(()=> const NavigationMenu());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF364242),
          foregroundColor: Colors.white,
          title: Text("News"),
          centerTitle: true,
        ),
        body: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    if (isLoading) {
      // Show circular progress indicator while data is being fetched
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFF364242),
        ),
      );
    } else {
      // Show list of articles once data is fetched
      return ListView.builder(
        itemCount: newsModelList.length,
        itemBuilder: (context, index) {
          final article = newsModelList[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
            decoration: BoxDecoration(
              color: const Color(0xFFB0BCBC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              onTap: () {
                _launchUrl(Uri.parse(article.url ?? ""));
              },
              leading: Image.network(
                article.urlToImage ?? PLACEHOLDER_IMAGE_LINK,
                height: 250,
                width: 100,
                fit: BoxFit.cover,
              ),
              title: Text(article.title ?? ""),
              subtitle: Text(
                article.publishedAt ?? "",
              ),
            ),
          );
        },
      );
    }
  }

  Future<void> _launchUrl(Uri url) async{
    if(!await launchUrl(url)){
      throw Exception('Could not launch $url');
    };
  }
}
