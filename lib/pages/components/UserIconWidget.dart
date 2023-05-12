// ignore_for_file: file_names

import 'package:flutter/material.dart';

/// 头像Icon

class UserIconWidget extends StatelessWidget {
  final bool isNetwork;
  final String image;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;

  const UserIconWidget(
      {Key? key,
      required this.isNetwork,
      required this.image,
      required this.onPressed,
      this.width = 30.0,
      this.height = 30.0,
      required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("test");
  }
}
