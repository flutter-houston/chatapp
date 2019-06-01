import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Views/BasePage.dart';

class NewsPage extends BasePage {
  NewsPage({Key key}):super(key: key, title: 'News');
  @override
  State<StatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding (
            padding: EdgeInsets.all(16.0),
            child: Column (
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Home!'),
        ],
      ),
    );
  }
}