import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Views/BasePage.dart';
import 'package:flutter_app/Views/RootPage.dart';

class LoginPage extends BasePage {
  LoginPage({Key key}):super(key: key, title: 'Login');
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username;
  String _password;
  bool _showError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'username',
                      icon: Icon(Icons.person),
                    ),
                    onChanged: (s) { _username = s; print(s);},
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'password',
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onChanged: (s) { _password = s;},
                  ),
                  ButtonTheme.bar(
                    // make buttons use the appropriate styles for cards
                    child: ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          textColor: Colors.white,
                          child: const Text('Login'),
                          onPressed: () {
                            if(_username == 'hussain' && _password == 'pass') {
                              _showError = false;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => RootPage()),
                              );
                            }
                            else
                              _showError = true;
                          },
                        ),
                        FlatButton(
                          child: const Text('Sign Up'),
                          onPressed: () {/* ... */},),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}