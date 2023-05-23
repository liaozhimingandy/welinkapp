import 'dart:io';

import 'package:welinkapp/core/flutter_im_sdk.dart';

class SignalingInfo {
  /// 操作者
  String? opUserID;

  /// 邀请信息
  InvitationInfo? invitation;

  /// 离线显示内容
  OfflinePushInfo? offlinePushInfo;

  SignalingInfo({
    this.opUserID,
    this.invitation,
    this.offlinePushInfo,
  });

  SignalingInfo.fromJson(Map<String, dynamic> json) {
    opUserID = json['opUserID'];
    invitation = json['invitation'] == null
        ? null
        : InvitationInfo.fromJson(json['invitation']);
    offlinePushInfo = json['offlinePushInfo'] == null
        ? null
        : OfflinePushInfo.fromJson(json['offlinePushInfo']);
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['opUserID'] = opUserID;
    data['invitation'] = invitation?.toJson();
    data['offlinePushInfo'] = offlinePushInfo?.toJson();
    return data;
  }
}

class InvitationInfo {
  /// 邀请者UserID
  String? inviterUserID;

  /// 被邀请者UserID列表，如果是单聊只有一个元素
  List<String>? inviteeUserIDList;

  /// 如果是单聊，为""
  String? groupID;

  /// 房间ID，必须唯一，可以不设置。
  String? roomID;

  /// 邀请超时时间（秒）
  int? timeout;

  /// 发起时间
  int? initiateTime;

  /// video 或者 audio
  String? mediaType;

  /// [ConversationType]1为单聊，2为群聊
  int? sessionType;

  /// 平台[Platform]
  int? platformID;

  InvitationInfo(
      {this.inviterUserID,
      this.inviteeUserIDList,
      this.groupID,
      this.roomID,
      this.timeout,
      this.initiateTime,
      this.mediaType,
      this.sessionType,
      this.platformID});

  InvitationInfo.fromJson(Map<String, dynamic> json) {
    inviterUserID = json['inviterUserID'];
    inviteeUserIDList = json['inviteeUserIDList'].cast<String>();
    groupID = json['groupID'];
    roomID = json['roomID'];
    timeout = json['timeout'];
    initiateTime = json['initiateTime'];
    mediaType = json['mediaType'];
    sessionType = json['sessionType'];
    platformID = json['platformID'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['inviterUserID'] = inviterUserID;
    data['inviteeUserIDList'] = inviteeUserIDList;
    data['groupID'] = groupID;
    data['roomID'] = roomID;
    data['timeout'] = timeout;
    data['initiateTime'] = initiateTime;
    data['mediaType'] = mediaType;
    data['sessionType'] = sessionType;
    data['platformID'] = platformID;
    return data;
  }
}

/// 信令凭证
class SignalingCertificate {
  /// 登录token
  String? token;

  /// 房间id
  String? roomID;

  /// 服务器地址
  String? liveURL;

  /// 占线列表
  List<String>? busyLineUserIDList;

  SignalingCertificate({
    this.token,
    this.roomID,
    this.liveURL,
    this.busyLineUserIDList,
  });

  SignalingCertificate.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    roomID = json['roomID'];
    liveURL = json['liveURL'];
    busyLineUserIDList = null == json['busyLineUserIDList']
        ? null : json['busyLineUserIDList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['token'] = token;
    data['roomID'] = roomID;
    data['liveURL'] = liveURL;
    data['busyLineUserIDList'] = busyLineUserIDList;
    return data;
  }
}

class RoomCallingInfo {
  InvitationInfo? invitation;
  List<Participant>? participant;
  String? roomID;
  String? token;
  String? liveURL;
  String? groupID;

  RoomCallingInfo({
    this.invitation,
    this.participant,
    this.roomID,
    this.token,
    this.liveURL,
    this.groupID,
  });

  RoomCallingInfo.fromJson(Map<String, dynamic> json) {
    invitation = json['invitation'] != null
        ? InvitationInfo.fromJson(json['invitation'])
        : null;
    if (json['participant'] != null) {
      participant = <Participant>[];
      json['participant'].forEach((v) {
        participant!.add(Participant.fromJson(v));
      });
    }
    roomID = json['roomID'] ?? invitation?.roomID;
    token = json['token'];
    liveURL = json['liveURL'];
    groupID = json['groupID'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (invitation != null) {
      data['invitation'] = invitation!.toJson();
    }
    if (participant != null) {
      data['participant'] = participant!.map((v) => v.toJson()).toList();
    }
    data['roomID'] = roomID;
    data['token'] = token;
    data['liveURL'] = liveURL;
    data['groupID'] = groupID;
    return data;
  }
}

class Participant {
  GroupInfo? groupInfo;
  GroupMembersInfo? groupMemberInfo;
  UserInfo? userInfo;

  Participant({this.groupInfo, this.groupMemberInfo, this.userInfo});

  Participant.fromJson(Map<String, dynamic> json) {
    groupInfo = json['groupInfo'] != null
        ? GroupInfo.fromJson(json['groupInfo'])
        : null;
    groupMemberInfo = json['groupMemberInfo'] != null
        ? GroupMembersInfo.fromJson(json['groupMemberInfo'])
        : null;
    userInfo =
        json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    if (groupInfo != null) {
      data['groupInfo'] = groupInfo!.toJson();
    }
    if (groupMemberInfo != null) {
      data['groupMemberInfo'] = groupMemberInfo!.toJson();
    }
    if (userInfo != null) {
      data['userInfo'] = userInfo!.toJson();
    }
    return data;
  }
}

class CustomSignaling {
  String? roomID;
  String? customInfo;

  CustomSignaling({this.roomID, this.customInfo});

  CustomSignaling.fromJson(Map<String, dynamic> json) {
    roomID = json['roomID'];
    customInfo = json['customInfo'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['roomID'] = roomID;
    data['customInfo'] = customInfo;
    return data;
  }
}
