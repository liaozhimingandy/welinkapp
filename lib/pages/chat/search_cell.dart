import 'package:flutter/material.dart';
import 'package:welinkapp/pages/chat/search_page.dart';
import 'package:welinkapp/pages/const.dart';

import 'chat.dart';

class SearchCell extends StatelessWidget {
  final List<Chat> datas;

  const SearchCell({Key? key, required this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => SearchPage(datas: datas)));
      },
      child: Container(
        height: 44,
        color: themeColor,
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/more.png'),
                width: 25,
                color: Colors.red,
              ),
              Text(
                '搜索',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
