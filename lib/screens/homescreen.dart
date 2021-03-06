import 'package:flutter/material.dart';
import 'package:whatsapp/page/chatpage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsapp Clone'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text('New Group'),
                value: "New Group",
              ),
              PopupMenuItem(
                child: Text('New Broadcast'),
                value: "New Broadcast",
              ),
              PopupMenuItem(
                child: Text('Whatsapp Web'),
                value: 'Whatsapp Web',
              ),
              PopupMenuItem(
                child: Text('Starred Messages'),
                value: "Starred Messages",
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("Camera"),
          Chatpage(),
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}
