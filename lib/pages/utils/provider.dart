import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class Provider {
  static late Database db;

  Future<List> getTables() async {
    // 获取数据库中所有的表
    // ignore: unnecessary_null_comparison
    if (db == null) {
      return Future.value([]);
    }
    List tables = await db
        .rawQuery('SELECT name FROM sqlite_master WHERE type = "table"');
    List<String> targetList = [];
    for (var item in tables) {
      targetList.add(item['name']);
    }
    return targetList;
  }

  Future checkTableIsRight() async {
    // 检查表
    List<String> expectTables = ['conversation'];
    List tables = await getTables();
    for (int i = 0; i < expectTables.length; i++) {
      if (!tables.contains(expectTables[i])) {
        return false;
      }
    }
    return true;
  }

  Future init(bool isCreate) async {
    // 初始化数据库
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app.db');
    debugPrint(path);
    try {
      db = await openDatabase(path);
    } catch (e) {
      debugPrint("Error $e");
    }
    bool tableIsRight = await checkTableIsRight();

    if (!tableIsRight) {
      // 关闭上面打开的db，否则无法执行open
      db.close();
      // Delete the database
      await deleteDatabase(path);
      ByteData data = await rootBundle.load(join("static", "app.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);

      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        debugPrint('db created version is $version');
      }, onOpen: (Database db) async {
        debugPrint('new db opened');
      });
    } else {
      debugPrint("Opening existing database");
    }
  }
}
