import 'dart:io';

import 'package:welinkapp/core/flutter_im_sdk.dart';

class Message {
  /// 消息id，唯一标识
  String? clientMsgID;

  /// 服务端生成的id
  String? serverMsgID;

  /// 创建时间
  int? createTime;

  /// 发送时间
  int? sendTime;

  /// 会话类型[ConversationType]
  int? sessionType;

  /// 发送者id
  String? sendID;

  /// 接收者id
  String? recvID;

  /// 来源
  int? msgFrom;

  /// 消息类型[MessageType]
  int? contentType;

  /// 平台[Platform]
  int? platformID;

  /// 发送者昵称
  String? senderNickname;

  /// 发送者头像
  String? senderFaceUrl;

  /// 群ID
  String? groupID;

  /// 消息内容
  String? content;

  /// 消息的seq
  int? seq;

  /// 是否已读
  bool? isRead;

  /// 已读时间
  int? hasReadTime;

  /// 消息发送状态[MessageStatus]
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
  FileElem? fileElem;

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

  bool? isReact;

  bool? isExternal;

  Message({
    this.clientMsgID,
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
    this.atElem,
    this.locationElem,
    this.customElem,
    this.quoteElem,
    this.mergeElem,
    this.notificationElem,
    this.faceElem,
    this.attachedInfoElem,
    this.isExternal,
    this.isReact,
  });

  Message.fromJson(Map<String, dynamic> json) {
    clientMsgID = json['clientMsgID'];
    serverMsgID = json['serverMsgID'];
    createTime = json['createTime'];
    sendTime = json['sendTime'];
    sendID = json['sendID'];
    recvID = json['recvID'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    platformID = json['platformID'];
    senderNickname = json['senderNickname'];
    senderFaceUrl = json['senderFaceUrl'];
    groupID = json['groupID'];
    content = json['content'];
    seq = json['seq'];
    isRead = json['isRead'];
    status = json['status'];
    offlinePush = json['offlinePush'] != null
        ? OfflinePushInfo.fromJson(json['offlinePush'])
        : null;
    attachedInfo = json['attachedInfo'];
    ex = json['ex'];
    ext = json['ext'];
    sessionType = json['sessionType'];
    pictureElem = json['pictureElem'] != null
        ? PictureElem.fromJson(json['pictureElem'])
        : null;
    soundElem = json['soundElem'] != null
        ? SoundElem.fromJson(json['soundElem'])
        : null;
    videoElem = json['videoElem'] != null
        ? VideoElem.fromJson(json['videoElem'])
        : null;
    fileElem =
        json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    atElem = json['atElem'] != null ? AtElem.fromJson(json['atElem']) : null;
    locationElem = json['locationElem'] != null
        ? LocationElem.fromJson(json['locationElem'])
        : null;

    customElem = json['customElem'] != null
        ? CustomElem.fromJson(json['customElem'])
        : null;
    quoteElem = json['quoteElem'] != null
        ? QuoteElem.fromJson(json['quoteElem'])
        : null;
    mergeElem = json['mergeElem'] != null
        ? MergeElem.fromJson(json['mergeElem'])
        : null;
    notificationElem = json['notificationElem'] != null
        ? NotificationElem.fromJson(json['notificationElem'])
        : null;
    faceElem =
        json['faceElem'] != null ? FaceElem.fromJson(json['faceElem']) : null;
    attachedInfoElem = json['attachedInfoElem'] != null
        ? AttachedInfoElem.fromJson(json['attachedInfoElem'])
        : null;
    hasReadTime = json['hasReadTime'] ?? attachedInfoElem?.hasReadTime;
    isExternal = json['isExternal'];
    isReact = json['isReact'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['clientMsgID'] = clientMsgID;
    data['serverMsgID'] = serverMsgID;
    data['createTime'] = createTime;
    data['sendTime'] = sendTime;
    data['sendID'] = sendID;
    data['recvID'] = recvID;
    data['msgFrom'] = msgFrom;
    data['contentType'] = contentType;
    data['platformID'] = platformID;
    data['senderNickname'] = senderNickname;
    data['senderFaceUrl'] = senderFaceUrl;
    data['groupID'] = groupID;
    data['content'] = content;
    data['seq'] = seq;
    data['isRead'] = isRead;
    data['hasReadTime'] = hasReadTime;
    data['status'] = status;
    data['offlinePush'] = offlinePush?.toJson();
    data['attachedInfo'] = attachedInfo;
    data['ex'] = ex;
    data['ext'] = ext;
    data['sessionType'] = sessionType;
    data['pictureElem'] = pictureElem?.toJson();
    data['soundElem'] = soundElem?.toJson();
    data['videoElem'] = videoElem?.toJson();
    data['fileElem'] = fileElem?.toJson();
    data['atElem'] = atElem?.toJson();
    data['locationElem'] = locationElem?.toJson();
    data['customElem'] = customElem?.toJson();
    data['quoteElem'] = quoteElem?.toJson();
    data['mergeElem'] = mergeElem?.toJson();
    data['notificationElem'] = notificationElem?.toJson();
    data['faceElem'] = faceElem?.toJson();
    data['attachedInfoElem'] = attachedInfoElem?.toJson();
    data['isExternal'] = isExternal;
    data['isReact'] = isReact;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          runtimeType == other.runtimeType &&
          clientMsgID == other.clientMsgID;

  @override
  int get hashCode => clientMsgID.hashCode;

  void update(Message message) {
    if (this != message) return;
    serverMsgID = message.serverMsgID;
    createTime = message.createTime;
    sendTime = message.sendTime;
    sendID = message.sendID;
    recvID = message.recvID;
    msgFrom = message.msgFrom;
    contentType = message.contentType;
    platformID = message.platformID;
    senderNickname = message.senderNickname;
    senderFaceUrl = message.senderFaceUrl;
    groupID = message.groupID;
    content = message.content;
    seq = message.seq;
    isRead = message.isRead;
    hasReadTime = message.hasReadTime;
    status = message.status;
    offlinePush = message.offlinePush;
    attachedInfo = message.attachedInfo;
    ex = message.ex;
    ext = message.ext;
    sessionType = message.sessionType;
    pictureElem = message.pictureElem;
    soundElem = message.soundElem;
    videoElem = message.videoElem;
    fileElem = message.fileElem;
    atElem = message.atElem;
    locationElem = message.locationElem;
    customElem = message.customElem;
    quoteElem = message.quoteElem;
    mergeElem = message.mergeElem;
    notificationElem = message.notificationElem;
    faceElem = message.faceElem;
    attachedInfoElem = message.attachedInfoElem;
  }

  /// 单聊消息
  bool get isSingleChat => sessionType == ConversationType.single;

  /// 群聊消息
  bool get isGroupChat =>
      sessionType == ConversationType.group ||
      sessionType == ConversationType.superGroup;
}

/// 图片消息内容
class PictureElem {
  /// 原路径
  String? sourcePath;

  /// 原图对象
  PictureInfo? sourcePicture;

  /// 大图对象
  PictureInfo? bigPicture;

  /// 缩率图对象
  PictureInfo? snapshotPicture;

  PictureElem(
      {this.sourcePath,
      this.sourcePicture,
      this.bigPicture,
      this.snapshotPicture});

  PictureElem.fromJson(Map<String, dynamic> json) {
    sourcePath = json['sourcePath'];
    sourcePicture = json['sourcePicture'] != null
        ? PictureInfo.fromJson(json['sourcePicture'])
        : null;
    bigPicture = json['bigPicture'] != null
        ? PictureInfo.fromJson(json['bigPicture'])
        : null;
    snapshotPicture = json['snapshotPicture'] != null
        ? PictureInfo.fromJson(json['snapshotPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sourcePath'] = sourcePath;
    if (sourcePicture != null) {
      data['sourcePicture'] = sourcePicture?.toJson();
    }
    if (bigPicture != null) {
      data['bigPicture'] = bigPicture?.toJson();
    }
    if (snapshotPicture != null) {
      data['snapshotPicture'] = snapshotPicture?.toJson();
    }
    return data;
  }
}

/// 图片信息
class PictureInfo {
  /// id
  String? uuid;

  /// 图片mime类型
  String? type;

  /// 大小
  int? size;

  /// 宽度
  int? width;

  /// 长度
  int? height;

  /// 图片URL地址
  String? url;

  PictureInfo(
      {this.uuid, this.type, this.size, this.width, this.height, this.url});

  PictureInfo.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['type'] = type;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    return data;
  }
}

/// 语音消息内容
class SoundElem {
  /// id
  String? uuid;

  /// 原路径
  String? soundPath;

  /// url地址
  String? sourceUrl;

  /// 大小
  int? dataSize;

  /// 时间s
  int? duration;

  SoundElem(
      {this.uuid,
      this.soundPath,
      this.sourceUrl,
      this.dataSize,
      this.duration});

  SoundElem.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    soundPath = json['soundPath'];
    sourceUrl = json['sourceUrl'];
    dataSize = json['dataSize'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['soundPath'] = soundPath;
    data['sourceUrl'] = sourceUrl;
    data['dataSize'] = dataSize;
    data['duration'] = duration;
    return data;
  }
}

/// 视频消息内容
class VideoElem {
  /// 视频路径
  String? videoPath;

  /// uuid
  String? videoUUID;

  /// 视频的url地址
  String? videoUrl;

  /// mime类型
  String? videoType;

  /// 大小
  int? videoSize;

  /// 时长s
  int? duration;

  /// 缩率图路径
  String? snapshotPath;

  /// 缩率图uuid
  String? snapshotUUID;

  /// 缩率图大小
  int? snapshotSize;

  /// 缩率图URL地址
  String? snapshotUrl;

  /// 缩率图宽度
  int? snapshotWidth;

  /// 缩率图高度
  int? snapshotHeight;

  VideoElem(
      {this.videoPath,
      this.videoUUID,
      this.videoUrl,
      this.videoType,
      this.videoSize,
      this.duration,
      this.snapshotPath,
      this.snapshotUUID,
      this.snapshotSize,
      this.snapshotUrl,
      this.snapshotWidth,
      this.snapshotHeight});

  VideoElem.fromJson(Map<String, dynamic> json) {
    videoPath = json['videoPath'];
    videoUUID = json['videoUUID'];
    videoUrl = json['videoUrl'];
    videoType = json['videoType'];
    videoSize = json['videoSize'];
    duration = json['duration'];
    snapshotPath = json['snapshotPath'];
    snapshotUUID = json['snapshotUUID'];
    snapshotSize = json['snapshotSize'];
    snapshotUrl = json['snapshotUrl'];
    snapshotWidth = json['snapshotWidth'];
    snapshotHeight = json['snapshotHeight'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['videoPath'] = videoPath;
    data['videoUUID'] = videoUUID;
    data['videoUrl'] = videoUrl;
    data['videoType'] = videoType;
    data['videoSize'] = videoSize;
    data['duration'] = duration;
    data['snapshotPath'] = snapshotPath;
    data['snapshotUUID'] = snapshotUUID;
    data['snapshotSize'] = snapshotSize;
    data['snapshotUrl'] = snapshotUrl;
    data['snapshotWidth'] = snapshotWidth;
    data['snapshotHeight'] = snapshotHeight;
    return data;
  }
}

/// 文件消息内容
class FileElem {
  /// 文件路径
  String? filePath;

  /// uuid
  String? uuid;

  /// 文件URL地址
  String? sourceUrl;

  /// 文件名
  String? fileName;

  /// 文件大小
  int? fileSize;

  FileElem(
      {this.filePath, this.uuid, this.sourceUrl, this.fileName, this.fileSize});

  FileElem.fromJson(Map<String, dynamic> json) {
    filePath = json['filePath'];
    uuid = json['uuid'];
    sourceUrl = json['sourceUrl'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['filePath'] = filePath;
    data['uuid'] = uuid;
    data['sourceUrl'] = sourceUrl;
    data['fileName'] = fileName;
    data['fileSize'] = fileSize;
    return data;
  }
}

/// @消息内容
class AtElem {
  /// 消息内容
  String? text;

  /// 被@的用户ID列表
  List<String>? atUserList;

  /// 是否包含自己
  bool? isAtSelf;

  /// 被@的用户ID跟昵称关系列表，用于将消息内容里的用户id替换为昵称显示
  List<AtUserInfo>? atUsersInfo;

  /// 被回复的消息体，回复别人并@了人
  Message? quoteMessage;

  AtElem({
    this.text,
    this.atUserList,
    this.isAtSelf,
    this.atUsersInfo,
    this.quoteMessage,
  });

  AtElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['atUserList'] is List) {
      atUserList = (json['atUserList'] as List).map((e) => '$e').toList();
    }
    isAtSelf = json['isAtSelf'];
    if (json['atUsersInfo'] is List) {
      atUsersInfo = (json['atUsersInfo'] as List)
          .map((e) => AtUserInfo.fromJson(e))
          .toList();
    }
    quoteMessage = null != json['quoteMessage']
        ? Message.fromJson(json['quoteMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['atUserList'] = atUserList;
    data['isAtSelf'] = isAtSelf;
    data['atUsersInfo'] = atUsersInfo?.map((e) => e.toJson()).toList();
    data['quoteMessage'] = quoteMessage?.toJson();
    return data;
  }
}

/// 位置消息内日
class LocationElem {
  /// 位置描述
  String? description;

  /// 经度
  double? longitude;

  /// 纬度
  double? latitude;

  LocationElem({this.description, this.longitude, this.latitude});

  LocationElem.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['longitude'] is int) {
      longitude = (json['longitude'] as int).toDouble();
    } else {
      longitude = json['longitude'];
    }

    if (json['latitude'] is int) {
      latitude = (json['latitude'] as int).toDouble();
    } else {
      latitude = json['latitude'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}

/// 自定义消息
class CustomElem {
  /// 自定义数据
  String? data;

  /// 扩展内容
  String? extension;

  /// 描述内容
  String? description;

  CustomElem({this.data, this.extension, this.description});

  CustomElem.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    extension = json['extension'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = data;
    data['extension'] = extension;
    data['description'] = description;
    return data;
  }
}

/// 引用消息（被回复的消息）
class QuoteElem {
  /// 回复内容内容
  String? text;

  /// 被回复的消息体
  Message? quoteMessage;

  QuoteElem({this.text, this.quoteMessage});

  QuoteElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['quoteMessage'] is Map) {
      quoteMessage = Message.fromJson(json['quoteMessage']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['quoteMessage'] = quoteMessage?.toJson();
    return data;
  }
}

/// 合并消息体
class MergeElem {
  /// 标题
  String? title;

  /// 摘要
  List<String>? abstractList;

  /// 具体选择合并的消息列表
  List<Message>? multiMessage;

  MergeElem({this.title, this.abstractList, this.multiMessage});

  MergeElem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['abstractList'] is List) {
      abstractList = json['abstractList'].cast<String>();
    }
    if (json['multiMessage'] is List) {
      multiMessage = (json['multiMessage'] as List)
          .map((e) => Message.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['abstractList'] = abstractList;
    data['multiMessage'] = multiMessage?.map((e) => e.toJson()).toList();
    return data;
  }
}

/// 通知
class NotificationElem {
  /// 详情
  String? detail;

  /// 提示
  String? defaultTips;

  NotificationElem({this.detail, this.defaultTips});

  NotificationElem.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    defaultTips = json['defaultTips'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['detail'] = detail;
    data['defaultTips'] = defaultTips;
    return data;
  }
}

/// 表情
class FaceElem {
  /// 位置表情，用户端对端自定义内嵌的表情包
  int? index;

  /// 其他表情，如URL表情直接返回url
  String? data;

  FaceElem({this.index, this.data});

  FaceElem.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index'] = index;
    data['data'] = data;
    return data;
  }
}

/// 附加信息
class AttachedInfoElem {
  /// 群消息已读信息
  GroupHasReadInfo? groupHasReadInfo;

  /// 是否为私聊消息（阅后即焚消息），单聊有效
  bool? isPrivateChat;

  /// 已读时间
  int? hasReadTime;

  /// 阅读时长 s
  /// 即从hasReadTime时间算起，超过了burnDuration秒触发销毁
  int? burnDuration;

  /// 离线不发送推送
  bool? notSenderNotificationPush;

  AttachedInfoElem({
    this.groupHasReadInfo,
    this.isPrivateChat,
    this.hasReadTime,
    this.burnDuration,
    this.notSenderNotificationPush,
  });

  AttachedInfoElem.fromJson(Map<String, dynamic> json) {
    groupHasReadInfo = json['groupHasReadInfo'] == null
        ? null
        : GroupHasReadInfo.fromJson(json['groupHasReadInfo']);
    isPrivateChat = json['isPrivateChat'];
    hasReadTime = json['hasReadTime'];
    burnDuration = json['burnDuration'];
    notSenderNotificationPush = json['notSenderNotificationPush'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groupHasReadInfo'] = groupHasReadInfo?.toJson();
    data['isPrivateChat'] = isPrivateChat;
    data['hasReadTime'] = hasReadTime;
    data['burnDuration'] = burnDuration;
    data['notSenderNotificationPush'] = notSenderNotificationPush;
    return data;
  }
}

/// 群消息已读信息
class GroupHasReadInfo {
  /// 已读的用户id列表
  List<String>? hasReadUserIDList;

  /// 已读总数
  int? hasReadCount;

  /// 发送此条消息时的群人数
  int? groupMemberCount;

  GroupHasReadInfo.fromJson(Map<String, dynamic> json) {
    if (json['hasReadUserIDList'] == null) {
      hasReadUserIDList = <String>[];
    } else {
      hasReadUserIDList = (json['hasReadUserIDList'] as List).cast<String>();
    }
    hasReadCount = json['hasReadCount'] ?? 0;
    groupMemberCount = json['groupMemberCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hasReadUserIDList'] = hasReadUserIDList;
    data['hasReadCount'] = hasReadCount;
    data['groupMemberCount'] = groupMemberCount;
    return data;
  }
}

/// 消息已读回执信息
class ReadReceiptInfo {
  /// 发送者id
  String? userID;

  /// 群id
  String? groupID;

  /// 已读消息的clientMsgID集合
  List<String>? msgIDList;

  /// 读时间
  int? readTime;

  /// 消息来源
  int? msgFrom;

  /// 消息类型[MessageType]
  int? contentType;

  /// 会话类型[ConversationType]
  int? sessionType;

  ReadReceiptInfo(
      {this.userID,
      this.groupID,
      this.msgIDList,
      this.readTime,
      this.msgFrom,
      this.contentType,
      this.sessionType});

  ReadReceiptInfo.fromJson(Map<String, dynamic> json) {
    userID = json['uid'] ?? json['userID'];
    groupID = json['groupID'];
    if (json['msgIDList'] is List) {
      msgIDList = (json['msgIDList'] as List).map((e) => '$e').toList();
    }
    readTime = json['readTime'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['msgIDList'] = msgIDList;
    data['readTime'] = readTime;
    data['msgFrom'] = msgFrom;
    data['contentType'] = contentType;
    data['sessionType'] = sessionType;
    return data;
  }
}

/// 离线推送信息
class OfflinePushInfo {
  /// 通知标题
  String? title;

  /// 通知描述
  String? desc;

  /// 扩展内容
  String? ex;

  /// 仅ios有效
  String? iOSPushSound;

  /// 仅ios有效
  bool? iOSBadgeCount;

  OfflinePushInfo(
      {this.title, this.desc, this.ex, this.iOSPushSound, this.iOSBadgeCount});

  OfflinePushInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    ex = json['ex'];
    iOSPushSound = json['iOSPushSound'];
    iOSBadgeCount = json['iOSBadgeCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['ex'] = ex;
    data['iOSPushSound'] = iOSPushSound;
    data['iOSBadgeCount'] = iOSBadgeCount;
    return data;
  }
}

/// @消息用户id跟昵称关系对象
class AtUserInfo {
  /// 被@的用户id
  String? atUserID;

  /// 被@的用户昵称
  String? groupNickname;

  AtUserInfo({this.atUserID, this.groupNickname});

  AtUserInfo.fromJson(Map<String, dynamic> json) {
    atUserID = json['atUserID'];
    groupNickname = json['groupNickname'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['atUserID'] = atUserID;
    data['groupNickname'] = groupNickname;
    return data;
  }
}

/// 消息撤回具体信息
class RevokedInfo {
  /// 撤回者ID
  String? revokerID;

  /// 撤回者群角色 [GroupRoleLevel]
  int? revokerRole;

  /// 撤回者昵称
  String? revokerNickname;

  /// 消息id
  String? clientMsgID;

  /// 撤回时间
  int? revokeTime;

  /// 消息发送时间
  int? sourceMessageSendTime;

  /// 消息发送者
  String? sourceMessageSendID;

  /// 消息发送者昵称
  String? sourceMessageSenderNickname;

  /// 会话类型 [ConversationType]
  int? sessionType;

  RevokedInfo({
    this.revokerID,
    this.revokerRole,
    this.revokerNickname,
    this.clientMsgID,
    this.revokeTime,
    this.sourceMessageSendTime,
    this.sourceMessageSendID,
    this.sourceMessageSenderNickname,
    this.sessionType,
  });

  RevokedInfo.fromJson(Map<String, dynamic> json) {
    revokerID = json['revokerID'];
    revokerRole = json['revokerRole'];
    revokerNickname = json['revokerNickname'];
    clientMsgID = json['clientMsgID'];
    revokeTime = json['revokeTime'];
    sourceMessageSendTime = json['sourceMessageSendTime'];
    sourceMessageSendID = json['sourceMessageSendID'];
    sourceMessageSenderNickname = json['sourceMessageSenderNickname'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['revokerID'] = revokerID;
    data['revokerRole'] = revokerRole;
    data['revokerNickname'] = revokerNickname;
    data['clientMsgID'] = clientMsgID;
    data['revokeTime'] = revokeTime;
    data['sourceMessageSendTime'] = sourceMessageSendTime;
    data['sourceMessageSendID'] = sourceMessageSendID;
    data['sourceMessageSenderNickname'] = sourceMessageSenderNickname;
    data['sessionType'] = sessionType;
    return data;
  }
}

class AdvancedMessage {
  List<Message>? messageList;
  bool? isEnd;
  int? errCode;
  String? errMsg;
  int? lastMinSeq;

  AdvancedMessage({
    this.messageList,
    this.isEnd,
    this.errCode,
    this.errMsg,
    this.lastMinSeq,
  });

  AdvancedMessage.fromJson(Map<String, dynamic> json) {
    messageList = json['messageList'] == null
        ? null
        : (json['messageList'] as List)
            .map((e) => Message.fromJson(e))
            .toList();
    isEnd = json['isEnd'];
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    lastMinSeq = json['lastMinSeq'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['messageList'] = messageList?.map((e) => e.toJson()).toList();
    data['isEnd'] = isEnd;
    data['errCode'] = errCode;
    data['errMsg'] = errMsg;
    data['lastMinSeq'] = lastMinSeq;
    return data;
  }
}

class RichMessageInfo {
  String? type;
  int? offset;
  int? length;
  String? url;
  String? info;

  RichMessageInfo({
    this.type,
    this.offset,
    this.length,
    this.url,
    this.info,
  });

  RichMessageInfo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offset = json['offset'];
    length = json['length'];
    url = json['url'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['offset'] = offset;
    data['length'] = length;
    data['url'] = url;
    data['info'] = info;
    return data;
  }
}

///////////////////// 消息修改相关/////////////////////
////////////////////////////////////////////////////

class KeyValue {
  String? typeKey;
  String? value;
  int? latestUpdateTime;

  KeyValue({this.typeKey, this.value, this.latestUpdateTime});

  KeyValue.fromJson(Map<String, dynamic> json) {
    typeKey = json['typeKey'];
    value = json['value'];
    latestUpdateTime = json['latestUpdateTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['typeKey'] = typeKey;
    data['value'] = value;
    data['latestUpdateTime'] = latestUpdateTime;
    return data;
  }
}

class UserExInfo {
  String? userID;
  String? ex;

  UserExInfo({this.userID, this.ex});

  UserExInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['ex'] = ex;
    return data;
  }
}

class SingleTypeKeyInfoSum {
  String? typeKey;
  int? counter;
  List<UserExInfo>? infoList;
  bool? isContainSelf;

  SingleTypeKeyInfoSum({
    this.typeKey,
    this.counter,
    this.infoList,
    this.isContainSelf,
  });

  SingleTypeKeyInfoSum.fromJson(Map<String, dynamic> json) {
    typeKey = json['typeKey'];
    counter = json['counter'];
    infoList = json['infoList'] == null
        ? null
        : (json['infoList'] as List)
            .map((e) => UserExInfo.fromJson(e))
            .toList();
    isContainSelf = json['isContainSelf'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['typeKey'] = typeKey;
    data['counter'] = counter;
    data['infoList'] = infoList?.map((e) => e.toJson()).toList();
    data['isContainSelf'] = isContainSelf;
    return data;
  }
}

class MessageKv {
  String? clientMsgID;
  List<SingleTypeKeyInfoSum>? changedKvList;

  MessageKv({this.clientMsgID, this.changedKvList});

  MessageKv.fromJson(Map<String, dynamic> json) {
    clientMsgID = json['clientMsgID'];
    changedKvList = json['changedKvList'] == null
        ? null
        : (json['changedKvList'] as List)
            .map((e) => SingleTypeKeyInfoSum.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['clientMsgID'] = clientMsgID;
    data['changedKvList'] = changedKvList?.map((e) => e.toJson()).toList();
    return data;
  }
}

class TypeKeySetResult {
  int? errCode;
  String? errMsg;
  String? typeKey;
  int? latestUpdateTime;
  String? value;

  TypeKeySetResult(
      {this.errCode,
      this.errMsg,
      this.typeKey,
      this.latestUpdateTime,
      this.value});

  TypeKeySetResult.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    typeKey = json['typeKey'];
    latestUpdateTime = json['latestUpdateTime'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errCode'] = errCode;
    data['errMsg'] = errMsg;
    data['typeKey'] = typeKey;
    data['latestUpdateTime'] = latestUpdateTime;
    data['value'] = value;
    return data;
  }
}

class MessageTypeKeyMapping {
  int? errCode;
  String? errMsg;
  Map<String, KeyValue>? reactionExtensionList;
  String? clientMsgID;

  MessageTypeKeyMapping(
      {this.errCode,
      this.errMsg,
      this.reactionExtensionList,
      this.clientMsgID});

  MessageTypeKeyMapping.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    reactionExtensionList = json['reactionExtensionList'] != null
        ? (json['reactionExtensionList'] as Map)
            .map((key, value) => MapEntry(key, KeyValue.fromJson(value)))
        : null;
    clientMsgID = json['clientMsgID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errCode'] = errCode;
    data['errMsg'] = errMsg;
    if (reactionExtensionList != null) {
      data['reactionExtensionList'] = reactionExtensionList!
          .map((key, value) => MapEntry(key, value.toJson()));
    }
    data['clientMsgID'] = clientMsgID;
    return data;
  }
}
