// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../enums.dart';

class ASIcon extends StatelessWidget {
  final String ASIconData;
  final double size;
  final Color color;
  final ASIconType type;

  const ASIcon(this.ASIconData, {
    super.key,
    this.size = 20,
    this.color = Colors.black,
    this.type = ASIconType.regular,
  });

  const ASIcon.solid(this.ASIconData, {
    super.key,
    this.size = 20,
    this.color = Colors.black,
    this.type = ASIconType.solid,
  });

  const ASIcon.duotone(this.ASIconData, {
    super.key,
    this.size = 20,
    this.color = Colors.black,
    this.type = ASIconType.duotone,
  });

  @override
  Widget build(BuildContext context) {
    return Text(ASIconData, style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.bold,
      fontFamily: (){
        switch(type){
          case ASIconType.regular:
            return 'FAR';
          case ASIconType.solid:
            return 'FAS';
          case ASIconType.duotone:
            return 'FAD';
        }
      }(),
    ),);
  }
}