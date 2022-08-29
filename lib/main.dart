import 'package:belajar_flutter/pertemuan1/FormRegristation.dart';
import 'package:belajar_flutter/pertemuan2/screen/ListTeamPL.dart';
import 'package:belajar_flutter/pertemuan2/screen/ListViewWA.dart';
import 'package:belajar_flutter/pertemuan1/LuasBangunDatar.dart';
import 'package:belajar_flutter/pertemuan2/screen/TabBarExample.dart';
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
      title: 'WhatsApp',
      theme: ThemeData(
      ),
      home: const TabbarExample(),
    );
  }
}


