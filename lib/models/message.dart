// 消息模型

class Message {
  Message(
      {this.clientMsgID,
      this.serverMsgID,
      this.createTime,
      this.sendTime,
      this.sessionType,
      this.sendID,
      this.recvID,
      this.msgFrom,
      this.contentType,
      this.platformID,
      this.senderNickname,
      this.senderFaceUrl,
      this.groupID,
      this.content,
      this.seq,
      this.isRead,
      this.hasReadTime,
      this.status,
      this.offlinePush,
      this.attachedInfo,
      this.ex,
      this.ext,
      this.pictureElem,
      this.soundElem,
      this.videoElem,
      this.fileElem,
      this.faceElem,
      this.atElem,
      this.locationElem,
      this.customElem,
      this.quoteElem,
      this.mergeElem,
      this.notificationElem,
      this.attachedInfoElem});

  /// 消息id，唯一标识
  String? clientMsgID;

  /// 服务端生成的id
  String? serverMsgID;

  /// 创建时间
  int? createTime;

  /// 发送时间
  int? sendTime;

  /// 会话类型[ConversationType]; 1: 单聊 0:群聊
  int? sessionType;

  /// 发送者id
  String? sendID;

  /// 接收者id
  String? recvID;

  /// 来源: 1: IOS, 2: Android, 3: Windows
  int? msgFrom;

  /// 消息类型[MessageType]; 1: IMTextElem
  int? contentType;

  /// 平台[Platform] 1: IOS 16.0
  int? platformID;

  /// 发送者昵称
  String? senderNickname;

  /// 发送者头像
  String? senderFaceUrl;

  /// 群ID
  String? groupID;

  /// 消息内容
  String? content;

  /// 消息的seq,本地消息序号
  int? seq;

  /// 是否已读
  bool? isRead;

  /// 已读时间
  int? hasReadTime;

  /// 消息发送状态[MessageStatus] 0: 发送中 1:已发送 2: 发送失败
  int? status;

  /// 离线显示内容
  OfflinePushInfo? offlinePush;

  /// 附加信息
  String? attachedInfo;

  /// 扩展信息
  String? ex;

  /// 自定义扩展信息，目前用于客服端处理消息时间分段
  dynamic ext;

  /// 图片
  PictureElem? pictureElem;

  /// 语音
  SoundElem? soundElem;

  /// 视频
  VideoElem? videoElem;

  /// 文件
  FaceElem? fileElem;

  /// @信息
  AtElem? atElem;

  /// 位置
  LocationElem? locationElem;

  /// 自定义
  CustomElem? customElem;

  /// 引用
  QuoteElem? quoteElem;

  /// 合并
  MergeElem? mergeElem;

  /// 通知
  NotificationElem? notificationElem;

  /// 自定义表情
  FaceElem? faceElem;

  /// 附加信息
  AttachedInfoElem? attachedInfoElem;
}

class VideoElem {}

class SoundElem {}

class AtElem {}

class LocationElem {}

class CustomElem {}

class QuoteElem {}

class AttachedInfoElem {}

class FaceElem {}

class NotificationElem {}

class MergeElem {}

class PictureElem {}

class OfflinePushInfo {}
