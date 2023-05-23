import 'package:flutter/services.dart';

import 'manager/im_manager.dart';

class IM {
  static const version = '1.0';
  static const _channel = MethodChannel('abc');
  static final iMManager = IMManager(_channel);
  IM._();
}
