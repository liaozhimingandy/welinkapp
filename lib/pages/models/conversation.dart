// 会话相关
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:welinkapp/pages/utils/provider.dart';

// 会话列表
List<Conversation> listConversation = [];

class Conversation {
  // 会话模型

  const Conversation(
      {required this.avatar,
      required this.title,
      required this.createAt,
      this.isMute = false,
      this.titleColor = 0xff353535,
      this.describtion = '',
      this.unReadMsgCount = 0,
      this.displayDot = false,
      this.isNetwork = false});

  final String avatar; // 用户头像
  final String title; // 标题
  final String describtion; // 描述
  final String createAt; // 消息时间
  final bool isMute; // 不通知
  final int titleColor; // 标题颜色
  final int unReadMsgCount; // 未读消息数量
  final bool displayDot; // 是否展示点
  final bool isNetwork; // 是否网络

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
        avatar: json['picture']['thumbnail'],
        // createAt: Util.getTimeDuration(json['registered']['date']),
        createAt: json['registered']['date'],
        title: json['name']['first'] + ' ' + json['name']['last'],
        describtion: json['location']['timezone']['description'],
        unReadMsgCount: json['unReadMsgCount'],
        isNetwork: true);
  }
}

class ConversationControlModel {
  // 会话管理

  Database db = Provider.db;
  final String table = 'conversation';

  Future<int> delete(String value, String key) async {
    // 删除指定的会话
    return await db.delete(table, where: '$key = ?', whereArgs: [value]);
  }
}
