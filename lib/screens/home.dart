import 'dart:convert';
import 'package:app_news/components/menu.dart';
import 'package:app_news/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../components/card_news.dart';
import '../models/news.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News> _news = [];

  bool finishScroll = false;
  int currentePage = 1;
  ScrollController scrollController = ScrollController();
  String keyword = '';

  //TextEditingController keyword = TextEditingController();

  Future<void> searchNews({int page = 1}) async {
    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=br&category=technology&pageSize=3&q=$keyword&page=$page&apiKey=353cf06cb084467eaa1f7cc2ae55e40d'),
    );

    setState(() {
      currentePage = page;

      _news += (jsonDecode(response.body)['articles'] as List)
          .map((e) => News.fromJson(e))
          .toList();
    });
  }

  changeSearch(String keyword) {
    _news = [];
    this.keyword = keyword;
    searchNews();
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    super.initState();
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      double scrollSize = scrollController.position
          .maxScrollExtent; // Se tiver no final da lista pode-se buscar novos usuarios

      if (pixels == scrollSize && !finishScroll) {
        searchNews(page: currentePage + 1);
      }
    });

    searchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Menu(
            changeSearch: changeSearch,
          ),
          preferredSize: const Size.fromHeight(53.0)),
      body: Column(
        children: [
          const SizedBox(height: 12),
          const Text(
            "Tecnologia",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: primaryTextColor,
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat'),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: _news.length,
                itemBuilder: (context, index) {
                  if (_news.isNotEmpty) {
                    return CardNews(newCard: _news[index]);
                  } else {
                    // return CircularProgressIndicator();
                    return const CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
