import 'package:flutter/material.dart';

import 'package:welinkapp/pages/const.dart';
import 'package:welinkapp/pages/friends/index_bar.dart';
import 'friends_data.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  FriendsPageState createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage>
    with AutomaticKeepAliveClientMixin<FriendsPage> {
  final ScrollController _scrollController = ScrollController();
  final Map _groupOffsetMap = {
    '🔍': 0.0,
  };
  final double _maxScrollExtent = double.maxFinite;
  @override
  bool get wantKeepAlive => true;

  @override
  // 一般是初始化数据
  void initState() {
    super.initState();
    datas.sort((Friends a, Friends b) {
      return a.indexLetter!.compareTo(b.indexLetter!);
    });

    var groupOffset = 54.0 * addressBooks.length;
    for (int i = 0; i < datas.length; i++) {
      // 第一个肯定有组标题
      if (i < 1) {
        _groupOffsetMap.addAll({datas[i].indexLetter!: groupOffset});
        groupOffset += 30.0 + 54.0;
      } else if (datas[i].indexLetter == datas[i - 1].indexLetter) {
        groupOffset += 54.0;
      } else {
        _groupOffsetMap.addAll({datas[i].indexLetter!: groupOffset});
        groupOffset += 30.0 + 54.0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            titleSpacing: 0.0,
            actions: [
              GestureDetector(
                onTap: () {
                  debugPrint('添加好友');
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         DiscoverChildPage(title: '添加好友')));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const Image(
                    image: AssetImage('assets/images/icon_friends_add.png'),
                    width: 30,
                  ),
                ),
              ),
            ],
            title: const Text("通讯录")),
        body: Container(
            color: themeColor,
            child: Stack(children: [
              ListView.builder(
                  controller: _scrollController,
                  itemBuilder: _itemForRow,
                  itemCount: addressBooks.length + datas.length),
              IndexBar(indexBarCallBack: (String str) {
                // print(str);
                if (_groupOffsetMap[str] != null) {
                  const duration = Duration(milliseconds: 10);
                  const curve = Curves.easeIn;
                  if (_groupOffsetMap[str] < _maxScrollExtent) {
                    _scrollController.animateTo(_groupOffsetMap[str],
                        duration: duration, curve: curve);
                  } else {
                    _scrollController.animateTo(_maxScrollExtent,
                        duration: duration, curve: curve);
                  }
                }
              }),
            ])));
  }
}

Widget _itemForRow(BuildContext context, int index) {
  /// 展示联系人:
  /// docs links: https://www.jianshu.com/p/7641f8fe5b52
  /// docs links: https://juejin.cn/post/7030231738752172046
  /// 系统条目
  if (index < addressBooks.length) {
    final one = addressBooks[index];
    return _FriendCell(
      name: one.title,
      groupTitle: null,
      imageUrl: one.imageName,
    );
  }

  /// 联系人条目
  final two = datas[index - addressBooks.length];
  if (index - addressBooks.length == 0) {
    return _FriendCell(
      imageUrl: two.imageUrl,
      name: two.name,
      groupTitle: two.indexLetter,
    );
  } else {
    final three = datas[index - addressBooks.length - 1];
    if (two.indexLetter == three.indexLetter) {
      return _FriendCell(
        imageUrl: two.imageUrl,
        name: two.name,
      );
    } else {
      return _FriendCell(
        imageUrl: two.imageUrl,
        name: two.name,
        groupTitle: two.indexLetter,
      );
    }
  }
}

class _FriendCell extends StatelessWidget {
  /// 联系人
  final String imageUrl;
  final String name;
  final String? groupTitle;

  const _FriendCell({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.groupTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: groupTitle == null ? 0 : 30,
            child: groupTitle == null
                ? null
                : Text(
                    groupTitle!,
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
            alignment: Alignment.centerLeft,
            color: themeColor,
            padding: const EdgeInsets.only(left: 10),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(image: NetworkImage(imageUrl)),
                  ), //头像
                ),
                Container(
                    child: Column(
                  children: [
                    Container(
                      child: Text(
                        name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      height: 53.5,
                      width: screenWidth(context) - 100,
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      color: themeColor,
                      width: screenWidth(context) - 100,
                      height: .5,
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
