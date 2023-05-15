import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin<ChatPage> {
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

  // 只会执行一次initState()
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    /// 组件初始化操作
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // 如果不加这句，从子页面回来会重新加载didChangeDependencies()方法
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
                  debugPrint(item);
                },
                onCanceled: () {
                  debugPrint('onCanceled');
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
        body: _buildConversationListView());
  }

  ListView _buildConversationListView() {
    final ScrollController scrollController = ScrollController();
    // 构建会话列表
    return ListView.builder(
      controller: scrollController,
      itemBuilder: buildConversationItem,
      itemCount: 10,
    );
  }
}

Widget buildConversationItem(BuildContext context, int index) {
  // 构建会话项

  return ListTile(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        // return new XKTabBar();
        return const Text('test');
      }));
    },
    leading: Image.network(
      "https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg",
      width: 40.0,
      height: 40.0,
      fit: BoxFit.cover,
    ),
    title: const Text("刘德华"),
    subtitle: const Text("今年的演唱会退票到账了吧？"),
    trailing: const Text("9:00"),
  );
}
