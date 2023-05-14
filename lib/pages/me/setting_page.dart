import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  SettingPageState createState() => SettingPageState();
}


class SettingPageState extends State<SettingPage> {
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
            title: const Text('设置'),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
              child: Column(
                children:[
                  buildRow(const Text('1.0', style: TextStyle(color: Colors.grey, fontSize: 18.0),), '当前版本号', false), 
                ],)
              )
          );
   }
}
