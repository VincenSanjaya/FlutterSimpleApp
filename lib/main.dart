import 'package:belajar_flutter/FormRegristation.dart';
import 'package:belajar_flutter/ListViewWA.dart';
import 'package:belajar_flutter/LuasBangunDatar.dart';
import 'package:belajar_flutter/TabBarExample.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const TabbarExample(),
    );
  }
}


