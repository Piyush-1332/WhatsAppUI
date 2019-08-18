import 'package:flutter/material.dart';
import 'pages/calls.dart';
import 'pages/camera.dart';
import 'pages/status.dart';
import 'pages/chat.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Color.fromARGB(255, 255, 255, 255),
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.camera_alt),
            ),
            new Tab(text: "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CALLS")
          ],
        ),
        actions: <Widget>[
          new Icon(
            Icons.search,
            size: 27.0,
          ),
          new Padding(
            padding: EdgeInsets.only(right: 6.0),
          ),
          new Icon(
            Icons.more_vert,
            size: 27.0,
          ),
          new Padding(
            padding: EdgeInsets.only(right: 6.0),
          )
        ],
        title: new Text("WhatsApp"),
      ),
      body: new TabBarView(
        children: <Widget>[
          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallScreen(),
        ],
        controller: _tabController,
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.message, color: Colors.white),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
