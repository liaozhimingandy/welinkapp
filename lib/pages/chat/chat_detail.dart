import 'package:flutter/material.dart';


class ChatDetailPage extends StatefulWidget{
  
  const ChatDetailPage({Key? key, required this.name}): super(key:key);

  final String name;

  @override
  State<StatefulWidget> createState() => _ChatDetailState();
}


class _ChatDetailState extends State<ChatDetailPage>{

  String name = '';

  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('demo')),
      body: Text(name)
      );
  }

    
}