import 'package:flutter/material.dart';
import 'package:karmathrevised/content_page.dart';
import 'package:karmathrevised/splash.dart';

import 'widgets/nav_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}

Widget _createMenuIcon(BuildContext context) => IconButton(
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      onPressed: () {
        // show menu
      },
    );

Widget _createCategoryRow(
    BuildContext context, String text, String subText, String image) {
  return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: GestureDetector(
          onTap: () {
            print('tapped');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContentPage(
                        label: text,
                      )),
            );
          },
          child: Container(
            padding: EdgeInsets.only(left: 5),
            width: MediaQuery.of(context).size.width - 10,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/" + image,
                  width: 30,
                  height: 30,
                ),
                Container(width: 5),
                Stack(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 0),
                      child: Text(text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 20),
                      child: Text(subText,
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                    ),
                  ],
                )
              ],
            ),
          )));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;

    return Scaffold(
        drawer: NavDrawer(),
        backgroundColor: Colors.grey,
        appBar: AppBar(
          // brightness: Platform.isIOS ? Brightness.light : Brightness.dark,
          backgroundColor: Color(0xFFff8700), // Color(0xFF02dac5)
          automaticallyImplyLeading: false,
          // leading: _createMenuIcon(context),
          elevation: 1.0,
          title: Text("  कर्मठ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 2,
              ),
              _createCategoryRow(context, "अज्ञात", "विशेष अवसर", "agyat.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(context, "भगवान", "परमेश्वर एक कल्पना", "bhagwan.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(context, "दर्द", "जीवन में बहुत दर्द है", "dard.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(context, "दोस्ती", "दोस्त जीवन सरल कर देते है", "dosti.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(context, "गुरु", "जीवन के मार्गदर्शक", "guru.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(context, "लगन", "विद्यार्थी की तत्परता", "lagan.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(context, "प्रेम", "इस संसार में प्रेम से बढ़ कर कुछ नहीं", "prema.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(
                  context, "प्रेरणा", "निराशा से मुक्त रहिए", "prerna.png"),
              Container(
                height: 3,
              ),
              _createCategoryRow(context, "त्याग", "कुछ पाने के लिए कुछ खोना पड़ता है", "tyag.png"),
              Container(
                height: 3,
              ),
            ],
          ),
        ));
  }
}
