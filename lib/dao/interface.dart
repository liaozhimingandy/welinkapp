import '../models/message.dart';

abstract class IMessageManager {
  void sendMessage(Message message); //发送消息
  Message createTextMessage(String content); //创建一个文本消息
}
