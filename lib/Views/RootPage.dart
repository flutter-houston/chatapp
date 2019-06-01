import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Views/BasePage.dart';
import 'package:flutter_app/Views/HomePage.dart';
import 'package:flutter_app/Models/TabBarItem.dart';
import 'package:flutter_app/Views/ChatPage.dart';

class RootPage extends BasePage {
  RootPage({Key key}):super(key: key, title: '');

  @override
  State<StatefulWidget> createState() => _RootPageState(title);
}

class _RootPageState extends State<RootPage> {

  int _selectedIndex = 0;
  String _currentTitle = '';
  static var _tabs = getTabs();
  static var _tabViews = getTabViews(_tabs);

  _RootPageState(String title){
    _currentTitle = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle),
      ),
      body: Center(
        child: _tabViews.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getNavigationBarItems(_tabs),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _tabSelected,
      ),
    );
  }

  static List<BottomNavigationBarItem> getNavigationBarItems(List<TabBarItem> tabs){
    var navigationBarItems = List<BottomNavigationBarItem>();
    for(int i=0;i<tabs.length;i++) {
      navigationBarItems.add(BottomNavigationBarItem(icon: tabs[i].icon, title: Text(tabs[i].title)));
    }
    return navigationBarItems;
  }

  static List<TabBarItem> getTabs(){
    return <TabBarItem>[
      TabBarItem('Home', Icon(Icons.home)),
      TabBarItem('Chat', Icon(Icons.chat)),
//      TabBarItem('News', Icon(Icons.category)),
//      TabBarItem('Events', Icon(Icons.calendar_today)),
//      TabBarItem('About', Icon(Icons.info)),
    ];
  }

  static List<Widget> getTabViews(List<TabBarItem> tabs){
    var tabViews = List<Widget>();
    for (int i=0; i < tabs.length; i++) {
      if(i==0)
        tabViews.add(HomePage());
      else
        tabViews.add(ChatPage());//Text(tabs.elementAt(i).title));
    }
    return tabViews;
  }

  void _tabSelected(int index) {
    setState(() {
      _currentTitle = _tabs[index].title;
      _selectedIndex = index;
      print('Title: $_currentTitle');
    });
  }
}
