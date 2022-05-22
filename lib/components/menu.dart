import 'package:flutter/material.dart';

import '../style/colors.dart';

class Menu extends StatelessWidget {
  final Function changeSearch;
  final TextEditingController keyword;

  const Menu({Key? key, required this.changeSearch, required this.keyword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 63,
      leading: const Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 6,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 17.5,
          backgroundImage: NetworkImage(
              'https://www.pngall.com/wp-content/uploads/7/Bill-Gates-PNG-Images.png'),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 34, top: 12),
        child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: secondaryBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: dropShadow,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 2),
            child: TextField(
              controller: keyword,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: primaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Pesquisar notícia',
                suffixIcon: IconButton(
                  onPressed: () {
                    changeSearch(keyword.text);
                  },
                  icon: const Icon(
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
    );
  }
}
