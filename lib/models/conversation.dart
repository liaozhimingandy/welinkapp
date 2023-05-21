// 会话相关
import 'package:floor/floor.dart';

@entity
class Conversation {
  // 会话模型
  Conversation(
      {
      this.conversationID,  
      required this.avatar,
      required this.title,
      required this.createAt,
      this.isMute = false,
      this.titleColor = 0xff353535,
      this.description = '',
      this.unReadMsgCount = 0,
      this.displayDot = false,
      this.isNetwork = false
      }
    );

  @PrimaryKey(autoGenerate: true)
  final int? conversationID; //会话ID
  final String avatar; // 用户头像
  final String title; // 昵称
  final String description; // 会话最新消息内容
  final String createAt; // 最新消息发送时间
  final bool isMute; // 不通知
  final int titleColor; // 标题颜色
  final int unReadMsgCount; // 未读消息数量
  final bool displayDot; // 是否展示点
  final bool isNetwork; // 是否网络
  /// 会话类型[ConversationType]
  /// 参与会话的userID
  /// 参与会话的groupID
  /// 打扰 0：正常；1：不接受消息；2：接受在线消息不接受离线消息；
  /// 强制提示，[GroupAtType]包含@所有人，@个人以及公告提示
  /// 草稿
  /// 草稿生成时间
  /// 是否置顶
  /// 是否开启了私聊（阅后即焚）
  /// 附加内容
  /// 是否还在组内，如果退群返回true
}

