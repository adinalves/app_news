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

  bool _finishScroll = false;
  int _currentPage = 1;
  ScrollController _scrollController = new ScrollController();

  TextEditingController keyword = new TextEditingController();

  Future<void> searchNews({int page = 1}) async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=br&category=technology&pageSize=3&q=${keyword.text}&page=${page}&apiKey=353cf06cb084467eaa1f7cc2ae55e40d'),
    );

    setState(() {
      _currentPage = page;

      _news += (jsonDecode(response.body)['articles'] as List)
          .map((e) => News.fromJson(e))
          .toList();
    });

    //print(jsonDecode(response.body)['articles']);

    print(_news[0].urlToImage);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      double pixels = _scrollController.position.pixels;
      double scrollSize = _scrollController.position
          .maxScrollExtent; // Se tiver no final da lista pode-se buscar novos usuarios

      if (pixels == scrollSize && !_finishScroll) {
        searchNews(page: _currentPage + 1);
      }
    });

    searchNews();
  }

  @override
  Widget build(BuildContext context) {
    if (_news.isNotEmpty) {
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
                  controller: keyword,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryTextColor),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Pesquisar notícia',
                    suffixIcon: IconButton(
                      onPressed: () {
                        print(keyword.text);

                        _news = [];
                        setState(() {
                          searchNews();
                        });
                      },
                      icon: Icon(
                        Icons.search,
                        size: 40,
                      ),
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
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: _news.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: secondaryBackgroundColor,
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_news[index].urlToImage!),
                                  // AssetImage('assets/images/image2.png'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Text(
                                    _news[index].title!,
                                    style: TextStyle(
                                        color: primaryTextColor, fontSize: 21),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(8)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xFFF5087F),
                                            Color(0xFFE8142A)
                                          ],
                                        )),
                                    width: 104,
                                    height: 27,
                                    //color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          bottom: 6,
                                          top: 6),
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
                              _news[index].description!,
                              style: TextStyle(
                                  color: textDescriptionColor, fontSize: 21),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
