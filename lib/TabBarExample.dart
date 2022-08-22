import 'package:belajar_flutter/ListViewWA.dart';
import 'package:flutter/material.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(text: "Chats",),
    Tab(text: "Status"),
    Tab(text: "Calls"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('WhatsApp'),
          actions: <Widget>[
        IconButton(
          padding: EdgeInsets.only(right: 15),
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
            IconButton(
              padding: EdgeInsets.only(right: 10),
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            )
    ]),
        body: TabBarView(
          controller: _controller,
          children: [
           ListViewWA(),
            Center(
                child: Text(
                  "No Status",
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  "No Calls Yet",
                  style: TextStyle(fontSize: 40),
                )),
          ],
        ),
      ),
    );
  }
}
