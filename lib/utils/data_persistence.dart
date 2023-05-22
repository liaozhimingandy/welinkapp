import 'package:sp_util/sp_util.dart';
import 'package:uuid/uuid.dart';

class DataPersistence {
  static const _DEVICE_ID = 'deviceID';

  /// 设备唯一ID

  DataPersistence._();

  static String getDeviceID() {
    var deviceID = SpUtil.getString(_DEVICE_ID);
    if (deviceID!.isEmpty) {
      deviceID = const Uuid().v4();
      SpUtil.putString(_DEVICE_ID, deviceID);
    }
    return deviceID;
  }
}
