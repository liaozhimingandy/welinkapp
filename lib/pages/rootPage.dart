import 'package:flutter/material.dart';

import 'package:welinkapp/pages/chat/chat_page.dart';
import 'package:welinkapp/pages/friends/friends_page.dart';
import 'package:welinkapp/pages/discover/discover_page.dart';
import 'package:welinkapp/pages/me/me_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  /// 当前导航索引
  int indexRouter = 0;

  /// body内容
  List<Widget> listBody = const [
    ChatPage(),
    FriendsPage(),
    DiscoverPage(),
    MePage(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("hello", textAlign: TextAlign.center,)),
      body: listBody[indexRouter],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexRouter,

        /// 图标和文本位置不变
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: '信息'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: '通讯录'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我')
        ],
        onTap: (value) => {
          /// 跳转到对应的导航页面
          setState(() {
            indexRouter = value;
          })
        },
      ),
    );
  }
}
