import 'package:flutter/material.dart';
import 'package:welinkapp/const.dart';

class DiscoverChildPage extends StatefulWidget {
  final String title;

  const DiscoverChildPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  DiscoverChildPageState createState() => DiscoverChildPageState();
}

class DiscoverChildPageState extends State<DiscoverChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
