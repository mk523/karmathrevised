import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Content extends StatefulWidget {
  final String text, type, category;
  final bool liked;

  const Content({Key key, this.text, this.type, this.category, this.liked})
      : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 5),
        width: MediaQuery.of(context).size.width - 10,
        // height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0, top: 0),
              child: Text(widget.text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 0, top: 20),
            //   child: Text(subText,
            //       style: TextStyle(color: Colors.black, fontSize: 14)),
            // ),
          ],
        ));
  }
}
