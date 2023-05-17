// 会话相关
import 'package:floor/floor.dart';

@entity
class Conversation {
  // 会话模型
  Conversation(
      {
      this.id,  
      required this.avatar,
      required this.title,
      required this.createAt,
      this.isMute = false,
      this.titleColor = 0xff353535,
      this.describtion = '',
      this.unReadMsgCount = 0,
      this.displayDot = false,
      this.isNetwork = false});

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String avatar; // 用户头像
  final String title; // 标题
  final String describtion; // 描述
  final String createAt; // 消息时间
  final bool isMute; // 不通知
  final int titleColor; // 标题颜色
  final int unReadMsgCount; // 未读消息数量
  final bool displayDot; // 是否展示点
  final bool isNetwork; // 是否网络
}

