import 'package:flutter/material.dart';
import 'package:welinkapp/components/UserIconWidget.dart';
import 'package:welinkapp/const.dart';

import 'my_info_page.dart';
import 'setting_page.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  MePageState createState() => MePageState();
}

class MePageState extends State<MePage>
    with AutomaticKeepAliveClientMixin<MePage> {

  // 头像组件
    Widget userImage =  UserIconWidget(
        padding: const EdgeInsets.only(top: 28.0, right: 18.0, left: 25.0),
        width: 55.0,
        height: 55.0,
        image: 'assets/images/default_nor_avatar.png',
        isNetwork: false,
        onPressed: () {
          // NavigatorUtils.goPerson(context, eventViewModel.actionUser);
        }
        );

  Widget buildRow(icon, title, isEnd) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        UserIconWidget(
            padding: const EdgeInsets.only(top: 0.0, right: 14.0, left: 14.0),
            width: 22.0,
            height: 22.0,
            image: icon,
            isNetwork: false,
            onPressed: () {
              // NavigatorUtils.goPerson(context, eventViewModel.actionUser);
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return const SettingPage();
                    },
                  ),
                );  
            }),
        Expanded(
          child: Container(
            decoration: !isEnd
                ? const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.white, width: .3)))
                : null,
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15.0, right: 10.0),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
      children: [
        ListView(
          children: [
            Container(
              height: 180.0,
              color: themeColor,
              child: RawMaterialButton(
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) {
                      return const MyInfoPage();
                    },
                  ),
                );
              },
              child: 
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userImage,
                      Expanded(
                        child: 
                          Container(
                            padding: const EdgeInsets.only(top: 83.0),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'leeo',
                                style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 2.0,
                              ),
                              const Text(
                                '19917192021',
                                maxLines: 1,
                                style: TextStyle(color: Colors.white, fontSize: 13.0),
                              )
                              ]
                              )
                            ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 65.0, bottom: 15.0, right: 10.0),
                          child: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        )
                      ],
                      ),
              ),
            ), // 头像部分
            const SizedBox(
              height:8
            ),
            Container(
              height: 54,
              margin: const EdgeInsets.all(10), 
              padding: const EdgeInsets.all(2),
              // color: Colors.white,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white
              ),// 调整角度
              child:
                buildRow('assets/images/more.png', '设置', true),
            ), // 设置
          ],
        )
      ],
    )
  );
  }
}
