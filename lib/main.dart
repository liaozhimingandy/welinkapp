import 'package:flutter/material.dart';

import 'package:welinkapp/pages/rootPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,

      ///开启开发模式
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: const Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: const Color.fromRGBO(1, 0, 0, 0.0),
        cardColor: Colors.green,
      ),
      home: const RootPage(),
    );
  }
}
