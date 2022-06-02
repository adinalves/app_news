import 'package:app_news/components/menu.dart';
import 'package:app_news/controller.dart';
import 'package:app_news/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../components/card_news.dart';

import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Controller();
  int currentPage = 1;
  ScrollController scrollController = ScrollController();
  final TextEditingController keyword = TextEditingController();

  changeSearch(String keyword) {
    currentPage = 1;
    this.keyword.text = keyword;
    controller.searchNews(keyword: this.keyword.text);
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    super.initState();
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;
      double scrollSize = scrollController.position.maxScrollExtent;
      if (pixels == scrollSize && !controller.finishScroll) {
        currentPage++;
        controller.searchNews(page: currentPage, keyword: keyword.text);
      }
    });

    controller.searchNews(keyword: keyword.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: Menu(
            changeSearch: changeSearch,
            keyword: keyword,
          ),
          preferredSize: const Size.fromHeight(64.0)),
      body: Observer(builder: (_) {
        return Column(
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
            if (controller.news.isNotEmpty)
              Expanded(
                child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: controller.news.length,
                    itemBuilder: (context, index) {
                      return CardNews(newCard: controller.news[index]);
                    }),
              ),
            if (controller.loading)
              Center(
                child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      maxWidth: 30,
                      maxHeight: 30,
                      minHeight: 20,
                    ),
                    child: const Center(child: CircularProgressIndicator())),
              ),
            if (controller.finishScroll) buildToast(),
          ],
        );
      }),
    );
  }
}

Widget buildToast() => Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: secondaryBackgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Não existem mais notícias para buscar',
              style: TextStyle(color: primaryTextColor, fontSize: 17),
            ),
          )
        ],
      ),
    );
