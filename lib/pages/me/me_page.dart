import 'package:flutter/material.dart';
import 'package:welinkapp/pages/discover/discover_cell.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage>
    with AutomaticKeepAliveClientMixin<MePage> {
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
                              '微信号:123456',
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
            color: const Color.fromRGBO(220, 220, 220, 1.0),
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    _headerCell(),
                    const SizedBox(
                      height: 10,
                    ),
                    // const DiscoverCell(
                    //     title: '支付', imageName: 'images/icon_right.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    const DiscoverCell(
                        title: '收藏', imageName: 'images/icon_right.png'),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 50,
                          height: 0.5,
                        )
                      ],
                    ),
                    // DiscoverCell(title: '相册', imageName: 'assets/images/more.png'),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 50,
                          height: 0.5,
                        )
                      ],
                    ),
                    // DiscoverCell(title: '卡包', imageName: 'images/微信卡包.png'),
                    Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 50,
                          height: 0.5,
                        )
                      ],
                    ),
                    // DiscoverCell(title: '表情', imageName: 'images/微信表情.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    // DiscoverCell(title: '设置', imageName: 'images/微信设置.png'),
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
