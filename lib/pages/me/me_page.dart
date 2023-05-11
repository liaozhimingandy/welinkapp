import 'package:flutter/material.dart';
import 'package:welinkapp/pages/const.dart';
import 'package:welinkapp/pages/discover/discover_cell.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  MePageState createState() => MePageState();
}

class MePageState extends State<MePage>
    with AutomaticKeepAliveClientMixin<MePage> {

   // 头像组件
  Widget _headerCell() {
    /// 头部组件
    return Container(
      height: 200,
      color: Colors.blue,
      child: Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/more.png')),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: const [
                            Text(
                              'Franky',
                              style: TextStyle(fontSize: 28),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '昵称',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            Image(
                              image: AssetImage('assets/images/more.png'),
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(
      body: Container(
        child: Stack(
        children: [
          Container(
            color: themeColor,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    _headerCell(),
                    const SizedBox(
                      height: 5,
                    ),
                    const DiscoverCell(
                        title: '收藏', imageName: 'images/icon_right.png'),
                    
                  ],
                )),
          ),
          Container(
              margin: const EdgeInsets.only(top: 40),
              height: 25,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Image(
                        image: AssetImage('assets/images/more.png'),
                      ),
                      onTap: () {
                        print('点击了拍照');
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
