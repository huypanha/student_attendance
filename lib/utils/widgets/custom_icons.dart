import 'package:flutter/material.dart';

import '../style.dart';

Widget clockInIcon({
  double size = 40,
  Color? color,
}) {
  color ??= Colors.grey[300];
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Text('\ue29e', style: Style.txtFAS(size: size, color: color),),
      Positioned(
        right: -3,
        bottom: -3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(3),
          child: Text('\uf354', style: Style.txtFAS(size: size / 2, color: Colors.green),),
        ),
      ),
    ],
  );
}

Widget clockOutIcon({
  double size = 40,
  Color? color,
}) {
  color ??= Colors.grey[300];
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Text('\ue29e', style: Style.txtFAS(size: size, color: color),),
      Positioned(
        right: -3,
        bottom: -3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(3),
          child: Text('\ue2be', style: Style.txtFAS(size: size / 2, color: Colors.red),),
        ),
      ),
    ],
  );
}

Widget clockCheckIcon({
  double size = 40,
  Color? color,
}) {
  color ??= Colors.grey[300];
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Text('\ue29e', style: Style.txtFAS(size: size, color: color),),
      Positioned(
        right: -3,
        bottom: -3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(3),
          child: Text('\uf00c', style: Style.txtFAS(size: size / 2, color: Style.primaryColor),),
        ),
      ),
    ],
  );
}