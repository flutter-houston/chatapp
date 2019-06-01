import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/Views/BasePage.dart';

class ChatPage extends BasePage {

  ChatPage({Key key}):super(key: key, title: 'Chat');
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    getData();
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            RaisedButton(
              child: Text('Create Record'),
              onPressed: () {
                createRecord();
              },
            ),

            RaisedButton(
              child: Text('View Record'),
              onPressed: () {
                getData();
              },
            ),
            RaisedButton(
              child: Text('Udate Record'),
              onPressed: () {
                updateData();
              },
            ),
            RaisedButton(
              child: Text('Delete Record'),
              onPressed: () {
                deleteData();
              },
            ),
          ],
        )
    );
  }

  void createRecord(){
    databaseReference.child("1").set({
      'title': 'Mastering EJB',
      'description': 'Programming Guide for J2EE'
    });
    databaseReference.child("2").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
  }
  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData(){
    databaseReference.child('1').update({
      'description': 'J2EE complete Reference'
    });
  }

  void deleteData(){
    databaseReference.child('1').remove();
  }
}