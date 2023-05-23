// APP全局配置初始化操作

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:welinkapp/core/flutter_im_sdk.dart';

class AppConfig {
  //初始化全局信息
  static Future init(Function() runApp) async {
    WidgetsFlutterBinding.ensureInitialized();
    cachePath = (await getApplicationDocumentsDirectory()).path;
    // sputil使用文档: https://pub.flutter-io.cn/packages/sp_util
    await SpUtil.getInstance();
    IM.iMManager.initSDK(platform: 1, apiAddr: 'http://localhost/', wsAddr: 'ws://localhost/', dataDir: cachePath,
      listener: OnConnectListener(
      onConnectSuccess: () {
        // 已经成功连接到服务器
      },
      onConnecting: () {
        // 正在连接到服务器，适合在 UI 上展示“正在连接”状态。
      },
      onConnectFailed: (code, errorMsg) {
        // 连接服务器失败，可以提示用户当前网络连接不可用
      },
      onUserTokenExpired: () {
        // 登录票据已经过期，请使用新签发的 UserSig 进行登录。
      },
      onKickedOffline: () {
        // 当前用户被踢下线，此时可以 UI 提示用户“您已经在其他端登录了当前账号，是否重新登录？”
      },
    ));
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
