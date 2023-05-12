import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'search_cell.dart';
import 'chat.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin<ChatPage> {
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
  void initState() {
    /// 组件初始化操作
    super.initState();

    /// 请求数据
    getData()
        .then((List<Chat>? value) {
          if (!_cancelConnect) {
            setState(() {
              _chatList = value!;
            });
          }
        })
        .catchError((onError) {
          print(onError);
        })
        .whenComplete(() {
          print('完成');
        })
        .timeout(const Duration(milliseconds: 5000))
        .catchError((timeoutError) {
          _cancelConnect = true;
          print('timeoutError...');
        });

    // final chat = {
    //   'name' : '张三',
    //   'message' : '吃了吗',
    //   'imageUrl' : 'imageUrl',
    // };
    // // Map转JSON
    // final jsonChat = json.encode(chat);
    // print(jsonChat);
    // // JSON转Map
    // final mapChat = json.decode(jsonChat);
    // print(mapChat);
    // (mapChat is Map);

    // final model = Chat.formJson(mapChat);
    // print(model.name);
  }

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
                    _buildMenuItem(
                        'assets/images/icon_friends_add.png', '添加朋友'),
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
                    child: Text('暂无消息'),
                  )
                : ListView.builder(
                    itemCount: _chatList.length + 1,
                    itemBuilder: _listViewItemBuilder,
                  )));
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    if (index == 0) {
      // return SearchCell();
      return SearchCell(datas: _chatList);
    } else {
      return ListTile(
        title: Text(_chatList[index - 1].name),
        subtitle: Container(
          child: Text(
            _chatList[index - 1].message,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_chatList[index - 1].imageUrl),
        ),
      );
    }
  }

  Future<List<Chat>?> getData() async {
    /// 异步请求消息内容
    _cancelConnect = false;
    var response = await http
        .get(Uri.parse('http://rap2api.taobao.org/app/mock/data/2042105'));
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      List<Chat> chatList = responseMap['chat_list'].map<Chat>((item) {
        return Chat.fromMap(item);
      }).toList();
      return chatList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }
}
