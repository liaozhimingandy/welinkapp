// 保存App配置的信息
 
class AppConfig {
  bool isBigScreen = false; //是否是大屏幕，比如desktop或者平板
  Enviroment enviroment = Enviroment.dev;

  String get apiHost {
    switch (enviroment) {
      case Enviroment.local:
        return "http://127.0.0.1:8888";
      case Enviroment.dev:
      case Enviroment.pro:
        return "http://120.77.215.190:8888";
    }
  }
}

//  环境

enum Enviroment {
  local, //本地环境
  dev, //测试环境
  pro, //生产环境
}