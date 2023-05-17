import 'package:flutter/material.dart';

import 'package:welinkapp/components/UserIconWidget.dart';


class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  MyInfoPageState createState() => MyInfoPageState();
}

class MyInfoPageState extends State<MyInfoPage> {
  // 头像组件
    Widget userImage =  UserIconWidget(
        padding: const EdgeInsets.only(right: 0.0),
        width: 55.0,
        height: 55.0,
        image: 'assets/images/default_nor_avatar.png',
        isNetwork: false,
        onPressed: () {
          // NavigatorUtils.goPerson(context, eventViewModel.actionUser);
        });

  Widget buildRow(child, title, isEnd) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: !isEnd
                  ? const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xffd9d9d9), width: .3)))
                  : null,
              padding: const EdgeInsets.only(top: 16.0),
              margin: const EdgeInsets.only(left: 15.0),
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
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 15.0, right: 5.0),
                        child: child,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15.0, right: 10.0),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('个人信息'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
            children:[
              buildRow(userImage, '头像', false),
              buildRow(const Text('leeo', style: TextStyle(color: Colors.grey, fontSize: 18.0),), '昵称', false), 
              buildRow(const Text('zwleee', style: TextStyle(color: Colors.grey, fontSize: 18.0),), '账号', true),
            ],)
          )
      );
    }
  }