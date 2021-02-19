import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'content.dart';
import 'package:http/http.dart' as http;

class ContentPage extends StatefulWidget {
  final String label;

  const ContentPage({Key key, this.label}) : super(key: key);
  @override
  _ContentPageState createState() => _ContentPageState();
}

Widget _createBackIcon(BuildContext context) => IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

class _ContentPageState extends State<ContentPage> {
  String category, type;
  bool _fetched;
  List<Widget> _contentList;

  Map<String, String> mapToText = {
    'अज्ञात': 'Agyat',
    'भगवान': 'Bhagwan',
    'दर्द': 'Dard',
    'दोस्ती': 'Dosti',
    'गुरु': 'Guru',
    'लगन': 'Lagan',
    'प्रेरणा': 'Prerna',
    'प्रेम': 'Pyaar',
    'त्याग': 'Tyag'
  };

  void initState() {
    _fetched = false;
    _contentList = List<Widget>();
    category = mapToText[widget.label];
    type = 'content';
    super.initState();
  }

  void _process() {
    getContentFromApi().then((value) {
      for (int i = 0; i < value.length; i++) {
        _contentList.add(Content(
          text: value[i]['content'],
          type: type,
          category: category,
          liked: value[i]['favorite'],
        ));
      }
      setState(() {
        _fetched = true;
      });
    });
  }

  Future<dynamic> getContentFromApi() async {
    String requestUrl = 'http://10.0.2.2:8080/main/get-content/';
    var response = await http.post(
      Uri.encodeFull(requestUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'category': category,
        'type': type,
      }),
    );
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    print(responseBody["list"]);
    return responseBody["list"];
  }

  _createPageLoadingWidget() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      color: Color(0xFFFFFFFF),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_fetched) _process();
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          // brightness: Platform.isIOS ? Brightness.light : Brightness.dark,
          backgroundColor: Color(0xFF02dac5),
          automaticallyImplyLeading: false,
          leading: _createBackIcon(context),
          elevation: 1.0,
          title: Text(widget.label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        body: _fetched
            ? SingleChildScrollView(
                child: Column(children: <Widget>[
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _contentList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: _contentList[index],
                          onTap: () {
                            print(index);
                          },
                        );
                      })
                ]),
              )
            : _createPageLoadingWidget());
  }
}
