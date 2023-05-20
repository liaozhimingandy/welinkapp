
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


import 'package:welinkapp/database/database.dart';
import 'package:welinkapp/pages/rootPage.dart';
import 'package:welinkapp/config/config.dart';

import 'dart:ui';

// 初始化
Future<void> setUp({bool test = false}) async {
//     getIt.registerSingleton<AppModel>(AppModelImplementation(),
//       signalsReady: true);
  GetIt.instance.registerSingleton<AppConfig>(AppConfig());
  AppConfig appConfig = GetIt.instance<AppConfig>();
  appConfig.enviroment = Enviroment.pro;
  if (window.physicalSize.aspectRatio > 1) {
    //说明是横屏或者大屏幕
    appConfig.isBigScreen = true;
  } else {
    appConfig.isBigScreen = false;
  }
  // 数据库操作
  final database = await $FloorAppDatabase.databaseBuilder('flutter_database.sqlite3').build();
  final dao = database.conversationDao;
  debugPrint(dao.findAllConversations().toString());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  setUp();  // 应用初始化数据库
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
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
