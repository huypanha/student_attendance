import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils.dart';

Widget loadingWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset("assets/lotties/loading.json", width: 100),
        Text("Loading", style: Style.txt14Grey,),
      ],
    ),
  );
}

Widget errorWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset("assets/lotties/error.json", width: 100),
        const SizedBox(height: 20,),
        Text("Something went wrong!", style: Style.txt14Grey,),
      ],
    ),
  );
}

Widget notFoundWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset("assets/lotties/not_found.json", width: 100),
        const SizedBox(height: 20,),
        Text("Not Found!", style: Style.txt14Grey,),
        const SizedBox(height: 20,),
      ],
    ),
  );
}

Widget noImageWidget({
  double? size = 50,
}) {
  return Center(
    child: Text("\ue1b7", style: Style.txtFAS(size: size, color: Colors.grey[300]),),
  );
}

Widget noProfileWidget({
  double size = 50,
}) {
  return Center(
    child: ASIcon.solid(ASIconData.user, size: size, color: Colors.grey[300]!),
  );
}

Widget divider() {
  return Divider(
    color: Colors.grey[200]!,
  );
}

Widget circularImage({
  required String path,
  double size = 50,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(
        color: Colors.grey[200]!,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Image.file(
        File(path),
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) => noImageWidget(size: size / 2),
      ),
    ),
  );
}

Widget angProfile({
  double size = 50,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(
        color: Colors.grey[200]!,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Image.asset(
        "assets/images/logo/angkor_system.jpg",
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) => noImageWidget(size: size / 2),
      ),
    ),
  );
}

Widget roundedImage({
  required String path,
  double size = 50,
  double radius = 10,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.white,
      border: Border.all(
        color: Colors.grey[200]!,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.file(
        File(path),
        fit: BoxFit.cover,
        errorBuilder: (context, _, __) => noImageWidget(size: size / 2),
      ),
    ),
  );
}