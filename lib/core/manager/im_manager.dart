
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:welinkapp/core/controller/im_manager_controller.dart';

class IMManager implements IIMManager{
  final MethodChannel _channel;

  IMManager(this._channel){
    _addNativeCallback(_channel);
  }
  
  void _addNativeCallback(MethodChannel _channel) {
    _channel.setMethodCallHandler((call) {
      try{
        debugPrint('$call.method');
        String type = call.arguments['type'];
         switch (type) {
              case 'initSDK':
                break;
         }
        }catch(error, stackTrace){
          debugPrint('回调失败了。${call.method} ${call.arguments['type']} ${call.arguments['data']} $error $stackTrace');
        }
      return Future.value(null);
    });
  }

@override
Future<dynamic> initSDK(){
  return _channel.invokeMethod(
        'initSDK',
        {'uid': 123}
  );
}

  @override
  Future<dynamic> uninitSDK() {
     return _channel.invokeMethod('unInitSDK', {});
  }


}