import '../../models/message.dart';

class IMCallback {
  /// 收到新消息时回调
  Function(Message message)? onRecvNewMessage;

  /// 消息发送进度回执
  Function(String msgId, int progress)? onMsgSendProgress;

  /// 新增会话
  // var conversationAddedSubject = BehaviorSubject<List<ConversationInfo>>();

  /// 旧会话更新
  // var conversationChangedSubject = BehaviorSubject<List<ConversationInfo>>();
  void progressCallback(String msgId, int progress) {
    onMsgSendProgress?.call(msgId, progress);
  }

  void recvNewMessage(Message msg) {
    // initLogic.showNotification(msg);
    onRecvNewMessage?.call(msg);
  }
}
