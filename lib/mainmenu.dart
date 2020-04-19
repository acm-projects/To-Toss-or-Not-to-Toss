import 'package:flutter/material.dart';
//import 'package:menu_test/scoreboard.dart';
import 'package:toss_menu/menuitem.dart';
import 'package:toss_menu/KYlogin.dart';
import 'package:toss_menu/picture.dart';
import 'package:toss_menu/gallery.dart';

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> {
  Widget _appBarTitle;
  Color _appBarBackgroundColor;
  MenuItem _selectedMenuItem;
  List<MenuItem> _menuItems;
  List<Widget> _menuOptionWidgets = [];

  @override
  initState() {
    super.initState();

    _menuItems = createMenuItems();
    _selectedMenuItem = _menuItems.first;
    _appBarTitle = new Text(_menuItems.first.title);
    _appBarBackgroundColor = _menuItems.first.color;
  }

  _getMenuItemWidget(MenuItem menuItem) {
    return menuItem.func();
  }

  _onSelectItem(MenuItem menuItem) {
    setState(() {
      _selectedMenuItem = menuItem;
      _appBarTitle = new Text(menuItem.title);
      _appBarBackgroundColor = menuItem.color;
    });
    Navigator.of(context).pop(); // close side menu
  }

  @override
  Widget build(BuildContext context) {
    _menuOptionWidgets = [];

    for (var menuItem in _menuItems) {
      _menuOptionWidgets.add(new Container(
          decoration: new BoxDecoration(
              color: menuItem == _selectedMenuItem
                  ? Colors.grey[200]
                  : Colors.white),
          child: new ListTile(
              leading: new Image.asset(menuItem.icon, fit: BoxFit.fill, scale: 3.7,),
              onTap: () => _onSelectItem(menuItem),
              title: Text(
                menuItem.title,
                style: new TextStyle(
                    fontSize: 20.0,
                    color: menuItem.color,
                    fontWeight: menuItem == _selectedMenuItem
                        ? FontWeight.bold
                        : FontWeight.w300),
              ))));

      _menuOptionWidgets.add(
        new SizedBox(
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
              height: 0.3,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: _appBarTitle,
        backgroundColor: Colors.white,//_appBarBackgroundColor,
        centerTitle: true,
        elevation: 0.0,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new ListTile(
                leading: new Image.asset('assets/tree.png'),
                title: Text("tishaarora2@gmail.com")),
              margin: new EdgeInsetsDirectional.only(top: 20.0),
              color: Colors.white,
              constraints: BoxConstraints(maxHeight: 90.0, minHeight: 90.0)),
            new SizedBox(
              child: new Center(
                child: new Container(
                  margin:
                  new EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
                  height: 0.3,
                  color: Colors.black,
                ),
              ),
            ),
            new Container(
              color: Colors.white,
              child: new Column(children: _menuOptionWidgets),
            ),
          ],
        ),
      ),
      body: _getMenuItemWidget(_selectedMenuItem),
    );
  }

  List<MenuItem> createMenuItems() {
    final menuItems = [
      new MenuItem("Log in/ Sign up", 'assets/tree.png', Colors.black,
              () => new MyApp()),
      //new MenuItem("Scoreboard", 'assets/tree.png', Colors.black,
              //() => new scoreboard()),
      new MenuItem("Take Picture",'assets/tree.png' , Colors.black,
              () => new Picture()),
      new MenuItem("Tree Progress", 'assets/tree.png', Colors.black,
              () => new Gallery()),
    ];
    return menuItems;
  }
}