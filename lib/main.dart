import 'package:flutter/material.dart';
import 'package:karmathrevised/splash.dart';

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
  return Container(
    // color: Colors.white,
    decoration: BoxDecoration(
      border: Border.all(width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(6.0)),
    ),
    child: Row(
      children: <Widget>[
        Image.asset(
          "assets/" + image,
          width: 30,
          height: 30,
        ),
        Column(
          children: <Widget>[
            Text(text, style: TextStyle(color: Colors.black, fontSize: 18)),
            Text(subText, style: TextStyle(color: Colors.black, fontSize: 16))
          ],
        )
      ],
    ),
  );
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
        appBar: AppBar(
          // brightness: Platform.isIOS ? Brightness.light : Brightness.dark,
          backgroundColor: Color(0xFFff8700),
          automaticallyImplyLeading: false,
          leading: _createMenuIcon(context),
          elevation: 1.0,
          title: Text("कर्मठ",
              style: TextStyle(color: Colors.black, fontSize: 18)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _createCategoryRow(context, "अज्ञात", "विशेष अवसर", "agyat.png"),
              _createCategoryRow(context, "भगवान", "विशेष अवसर", "agyat.png"),
              _createCategoryRow(context, "दर्द", "विशेष अवसर", "agyat.png"),
              _createCategoryRow(context, "दोस्ती", "विशेष अवसर", "agyat.png"),
              _createCategoryRow(context, "गुरु", "विशेष अवसर", "agyat.png"),
              _createCategoryRow(context, "लगन", "विशेष अवसर", "agyat.png"),
              _createCategoryRow(
                  context, "प्रेरणा", "विशेष अवसर", "prerna.png"),
              _createCategoryRow(context, "प्रेम", "विशेष अवसर", "prema.png"),
              _createCategoryRow(context, "त्याग", "विशेष अवसर", "agyat.png")
            ],
          ),
        ));
  }
}
