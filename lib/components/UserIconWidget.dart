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
      this.padding = const EdgeInsets.only(top: 4.0, right: 5.0, left: 5.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding,
        constraints: const BoxConstraints(minWidth: 0.0, minHeight: 0.0),
        onPressed: onPressed,
        child: 
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)), 
            child: isNetwork ? FadeInImage.assetNetwork(
              placeholder: 'assets/images/default_nor_avatar.png',
              //预览图
              fit: BoxFit.fitWidth,
              image: image,
              width: width,
              height: height,
          ) : Image.asset(
            image,
            fit: BoxFit.cover,
            width: width,
            height: height,
          )
        ),
      );
  }
}
