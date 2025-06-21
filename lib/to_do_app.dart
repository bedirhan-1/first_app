import 'package:first_app/constants/Colors.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buidAppBar(),
        body: Home(),
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(title: const Text('Item 2'), onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buidAppBar() {
    return AppBar(
      backgroundColor: bg,
      scrolledUnderElevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.blue,
          iconSize: 30,
          splashColor: Colors.transparent, // 🔇 ripple yok
          highlightColor: Colors.transparent,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("images/avatar.jpg", fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
