

import 'package:app_news/style/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXwWPGhCN2YY2wu9tCtYe5fhKe7XcJSrWqbA&usqp=CAU'),
                            // AssetImage('assets/images/image2.png'),
                          ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Text(
                          "Título da notícia",
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
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 12,right: 12,bottom: 6,top: 6),
                              child: Text(
                    "Tecnologia",
                    style: TextStyle(
                    color: primaryTextColor, fontSize: 14,),
                    textAlign: TextAlign.center,
                  ),
                            ),
                            
                          ),
                         )
                     
                    ],
                  ),
                  Text(
                    "Descrição da tecnologia",
                    style: TextStyle(
                    color: textDescriptionColor, fontSize: 21),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
