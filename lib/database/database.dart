import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:welinkapp/dao/conversation_dao.dart';
import 'package:welinkapp/models/conversation.dart';

part 'database.g.dart'; // the generated code will be there
// 在 database.dart 所在目录下，输入 flutter pub run build_runner build 会生成 database.g.dart 文件
// 接下来的数据库操作就会通过这个文件

@Database(version: 1, entities: [Conversation])
abstract class AppDatabase extends FloorDatabase {
  ConversationDao get conversationDao;
  // MessageDao get messageDao;
}
