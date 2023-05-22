import '../models/message.dart';

abstract class IMessageManager {
  Future<void> sendMessage(Message message, String to); //发送消息
  Future<Message> createTextMessage(String content); // 创建一个文本消息
  Future<int> removeMessage(Message message); // 删除消息
  Future<int> saveMessage(Message message); //  保存消息到数据库
  Future<void> setAdvancedMsgListener(); // 设置消息监听者
}
