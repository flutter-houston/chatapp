import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Views/BasePage.dart';

class HomePage extends BasePage {
  HomePage({Key key}):super(key: key, title: 'Home');
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding (
            padding: EdgeInsets.all(16.0),
            child: Column (
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Home')
        ],
      ),
    );
  }
}