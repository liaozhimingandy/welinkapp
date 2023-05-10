import 'package:flutter/material.dart';

import 'package:welinkapp/pages/const.dart';
import 'chat.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
with AutomaticKeepAliveClientMixin<ChatPage>{

  List<Chat> _chatList = [];
  bool _cancelConnect = false;

  /// 菜单
  PopupMenuItem _buildMenuItem(String imageName, String title) {
    return PopupMenuItem(
      value: {
        'imageName': imageName,
        'title': title,
      },
      child: Row(
        children: [
          Image(
            image: AssetImage(imageName),
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: const Text(
          "信息",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              color: const Color.fromRGBO(0, 0, 0, 0.5),
              onSelected: (item) {
                print(item);
              },
              onCanceled: () {
                print('onCanceled');
              },
              offset: const Offset(0, 60),
              child: const Image(
                image: AssetImage('assets/images/more.png'),
                width: 25,
                height: 25,
              ),
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem>[
                  // _buildMenuItem('images/发起群聊.png', '发起群聊'),
                  _buildMenuItem('assets/images/icon_friends_add.png', '添加朋友'),
                  // _buildMenuItem('images/扫一扫1.png', '扫一扫'),
                  // _buildMenuItem('images/收付款.png', '收付款'),
                ];
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: _chatList.isEmpty
            ? const Center(
          child:  Text('暂无消息'),
        ) : ListView.builder(
          itemCount: _chatList.length + 1,
          itemBuilder: _listViewItemBuilder,
        )
      );
  }
}


 Widget _listViewItemBuilder(BuildContext context, int index){
  return const Text("消息内容");
 }