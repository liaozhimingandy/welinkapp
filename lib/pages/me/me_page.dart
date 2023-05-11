import 'package:flutter/material.dart';
import 'package:welinkapp/pages/components/UserIconWidget.dart';
import 'package:welinkapp/pages/discover/discover_cell.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  MePageState createState() => MePageState();
}

class MePageState extends State<MePage>
    with AutomaticKeepAliveClientMixin<MePage> {

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
              }),
          Expanded(
            child: Container(
              decoration: !isEnd
                  ? const BoxDecoration(
                       border: Border(
                          bottom:
                              BorderSide(color: Color(0xffd9d9d9), width: .3)))
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
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15.0, right: 10.0),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
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
    
    return  Stack(
      children: [
        ListView(
          children: [
            Container(
               height: 180.0,
               color: Colors.blue,
               child: 
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                         MaterialPageRoute(
                            builder: (c) {
                              return const DiscoverCell(title: 'test', imageName: '',);
                            },
                        ),
                      );
                }
               ),
            ), // 头像
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.blue,
                  height: 18.0,
                ),
                buildRow('assets/images/more.png', '设置', true),
              ],
            ) // 设置
          ],
        )
      ],
    );
  }
}
