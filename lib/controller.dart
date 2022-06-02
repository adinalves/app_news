import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import 'models/news.dart';

part 'controller.g.dart';

class Controller = _Controller with _$Controller;

abstract class _Controller with Store {
  @observable
  bool loading = true;

  @observable
  bool finishScroll = false;

  @observable
  List<News> news = [];

  @action
  Future<void> searchNews({int page = 1, String keyword = ''}) async {
    loading = true;
    finishScroll = false;

    if (page == 1) news = [];

    var response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=br&category=technology&pageSize=3&&q=$keyword&page=$page&apiKey=353cf06cb084467eaa1f7cc2ae55e40d'),
    );

    if ((jsonDecode(response.body)['articles'] as List).isEmpty) {
      finishScroll = true;
    }

    news += (jsonDecode(response.body)['articles'] as List)
        .map((e) => News.fromJson(e))
        .toList();

    loading = false;
  }
}
