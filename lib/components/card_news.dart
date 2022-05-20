import 'package:app_news/models/news.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../style/colors.dart';

class CardNews extends StatelessWidget {
  final News newCard;
  const CardNews({
    Key? key,
    required this.newCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(newCard.url!))) {}
          throw {'Não é possível abrir ${(newCard).url}'};
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: secondaryBackgroundColor,
          //color: Colors.white,
          child: Column(
            children: [
              Stack(
                // alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(newCard.urlToImage!),
                      // AssetImage('assets/images/image2.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      color: const Color(0xFF000030).withOpacity(0.5),
                      padding: const EdgeInsets.only(left: 12, bottom: 6),
                      width: 355,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, left: 6, right: 6),
                        child: Text(
                          newCard.title!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: primaryTextColor,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(8)),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xFFF5087F), Color(0xFFE8142A)],
                          )),
                      width: 104,
                      height: 27,
                      //color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, bottom: 5, top: 5),
                        child: Text(
                          "Tecnologia",
                          style: TextStyle(
                              color: primaryTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  newCard.description!,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: textDescriptionColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
