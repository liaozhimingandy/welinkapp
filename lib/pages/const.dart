import 'dart:math';

import 'package:flutter/material.dart';

// 主题色
const Color themeColor = Color.fromRGBO(233,235,238, 1.0);

// 屏幕宽
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// 屏幕高
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// 随机色
Color randomColors() {
  var rng = Random();
  return Color.fromRGBO(
      rng.nextInt(255), rng.nextInt(255), rng.nextInt(255), 1.0);
}
