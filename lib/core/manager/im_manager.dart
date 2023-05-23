import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:welinkapp/core/controller/im_manager_controller.dart';

class IMManager implements IIMManager {
  MethodChannel _channel;

  IMManager(this._channel) {
    _addNativeCallback(_channel);
  }

  // try {
  //   debugPrint('$call');
  //   String type = call.arguments['type'];
  //   switch (call.method) {
  //     case 'initSDK':
  //       break;
  //   }
  // } catch (error, stackTrace) {
  //   debugPrint(
  //       '回调失败了。${call.method} ${call.arguments['type']} ${call.arguments['data']} $error $stackTrace');
  // }
  // return Future.value(null);

  @override
  Future<dynamic> initSDK() {
    return _channel.invokeMethod('getBatteryLevel');
    // return Future.value(null);
  }

  @override
  Future<dynamic> uninitSDK() {
    return _channel.invokeMethod('unInitSDK', {});
  }

  void _addNativeCallback(MethodChannel channel) {
    _channel.setMethodCallHandler((call) {
      try {
        debugPrint('$call');
        String type = call.arguments['type'];
        switch (call.method) {
          case 'initSDK':
            break;
        }
      } catch (error, stackTrace) {
        debugPrint(
            '回调失败了。${call.method} ${call.arguments['type']} ${call.arguments['data']} $error $stackTrace');
      }
      return Future.value(null);
    });
  }
}
