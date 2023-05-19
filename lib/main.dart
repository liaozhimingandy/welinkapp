import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:welinkapp/database/database.dart';
import 'package:welinkapp/pages/rootPage.dart';

final GetIt getIt = GetIt.instance;
// 初始化
Future<void> setUp({bool test = false}) async {
//     getIt.registerSingleton<AppModel>(AppModelImplementation(),
//       signalsReady: true);
  getIt.registerSingleton(
      () => $FloorAppDatabase.databaseBuilder('flutter_database.db').build());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  // 初始化数据库

  setUp();

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
