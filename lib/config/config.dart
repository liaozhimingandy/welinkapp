// APP全局配置初始化操作

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sp_util/sp_util.dart';

class AppConfig {
  //初始化全局信息
  static Future init(Function() runApp) async {
    WidgetsFlutterBinding.ensureInitialized();
    cachePath = (await getApplicationDocumentsDirectory()).path;
    // sputil使用文档: https://pub.flutter-io.cn/packages/sp_util
    await SpUtil.getInstance();
    runApp();
  }

  // app目录
  static late String cachePath;
  // 秘钥
  static const secret = 'secret';
  bool isBigScreen = false;
  static const UI_W = 375.0;
  static const UI_H = 812.0;
}
