import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/Views/BasePage.dart';
import 'package:flutter_app/Views/ChatMessage.dart';

class ChatPage extends BasePage {

  ChatPage({Key key}):super(key: key, title: 'Chat');
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatPage> {

  final databaseReference = FirebaseDatabase.instance.reference();
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  var date = DateTime.now().toString();

  void _handleSubmit(String text) {
    _chatController.clear();
      ChatMessage message = new ChatMessage(
          text: text
      );
    setState(() {
       _messages.insert(0, message);
       databaseReference.child(date).set({
          "date": _messages,
        });
    });

  }

  Widget _chatEnvironment (){
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
          child: new Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Starts typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),

                onPressed: ()=> _handleSubmit(_chatController.text),

              ),
            )
          ],
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Flexible(
            child: ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _chatEnvironment(),)
        ],
      );

    //   getData();
    // return Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: <Widget>[
    //
    //         RaisedButton(
    //           child: Text('Create Record'),
    //           onPressed: () {
    //             createRecord();
    //           },
    //         ),
    //
    //         RaisedButton(
    //           child: Text('View Record'),
    //           onPressed: () {
    //             getData();
    //           },
    //         ),
    //         RaisedButton(
    //           child: Text('Udate Record'),
    //           onPressed: () {
    //             updateData();
    //           },
    //         ),
    //         RaisedButton(
    //           child: Text('Delete Record'),
    //           onPressed: () {
    //             deleteData();
    //           },
    //         ),
    //       ],
    //     )
    // );

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

  void createRecord(){
    // var date = DateTime.now().toString();
    databaseReference.child(date).set({
      "timestamp": date,
      "message" : _messages,
    });
  }

  }
}
