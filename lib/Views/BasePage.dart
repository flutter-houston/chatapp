import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Views/ErrorAbs.dart';

class BasePage extends StatefulWidget implements ErrorAbs {
  final String title;
  BasePage({Key key, this.title}) : super(key: key);

  @override
  logError(String msg) {
    print(msg);
  }

  @override
  State<StatefulWidget> createState() {
    debugPrint("createState called on BasePage");
    return null;
  }
}