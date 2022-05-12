import 'dart:convert';

import 'package:app_news/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> _news = [];
  String _keyword = '';

  Future<void> searchNews({int page = 1}) async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=br&category=technology&pageSize=3&q=$_keyword&page=$page&apiKey=353cf06cb084467eaa1f7cc2ae55e40d'),
    );

    setState(() {
      _news += (jsonDecode(response.body)['articles'] as List)
          .map((e) => News.fromJson(e))
          .toList();
    });

    //print(jsonDecode(response.body)['articles']);
    print("URL AKIII:");
    print(_news[0].urlToImage);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ENTROU AKI");
    searchNews();
  }

  @override
  Widget build(BuildContext context) {
    print("ENTROU 2");
    if (_news.isNotEmpty)
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12, right: 6),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 17.5,
              backgroundImage: NetworkImage(
                  'https://www.pngall.com/wp-content/uploads/7/Bill-Gates-PNG-Images.png'),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 34),
            child: Container(
              color: secondaryBackgroundColor,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryTextColor),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pesquisar notícia',
                    suffixIcon: Icon(
                      Icons.search,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 12),
              Text(
                "Tecnologia",
                style: TextStyle(color: primaryTextColor, fontSize: 21),
              ),
              SizedBox(height: 15),
              Card(
                color: secondaryBackgroundColor,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(_news[0].urlToImage!),
                          // AssetImage('assets/images/image2.png'),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            _news[0].title!,
                            style: TextStyle(
                                color: primaryTextColor, fontSize: 21),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            // decoration: BoxDecoration(
                            //   gradient: LinearGradient(
                            //     begin: Alignment.topRight,
                            //     end: Alignment.bottomLeft,
                            //     colors: [Colors.blue,Colors.red],

                            //     )
                            // ),
                            width: 104,
                            height: 27,
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 6, top: 6),
                              child: Text(
                                "Tecnologia",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      _news[0].description!,
                      style:
                          TextStyle(color: textDescriptionColor, fontSize: 21),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    else
      return SizedBox();
  }
}
