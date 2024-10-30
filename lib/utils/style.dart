import 'package:flutter/material.dart';

class Style {
  static Color primaryColor = const Color(0xff5a73e0);
  static Color primaryBackgroundColor = const Color.fromRGBO(249, 250, 251, 1);

  static TextStyle txt14Black = const TextStyle(fontSize: 14, color: Colors.black,);
  static TextStyle txt14Grey = const TextStyle(fontSize: 14, color: Colors.grey,);
  static TextStyle txt14White = const TextStyle(fontSize: 14, color: Colors.white,);
  static TextStyle txt14PrimaryColor = TextStyle(fontSize: 14, color: primaryColor,);
  static TextStyle txt14Red = const TextStyle(fontSize: 14, color: Colors.red,);
  static TextStyle txt16 = const TextStyle(fontSize: 16, color: Colors.black,);
  static TextStyle txt16Grey = const TextStyle(fontSize: 16, color: Colors.grey,);
  static TextStyle txt16Green = const TextStyle(fontSize: 16, color: Colors.green,);
  static TextStyle txt16White = const TextStyle(fontSize: 16, color: Colors.white,);
  static TextStyle txt16PrimaryColor = TextStyle(fontSize: 16, color: primaryColor,);
  static TextStyle txt16Red = const TextStyle(fontSize: 16, color: Colors.red,);
  static TextStyle txt20 = const TextStyle(fontSize: 20, color: Colors.black,);
  static TextStyle txt20Grey = const TextStyle(fontSize: 20, color: Colors.grey,);
  static TextStyle txt30Bold = const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold,);

  static TextStyle txtManrope16Red = const TextStyle(fontSize: 16, color: Colors.red, fontFamily: 'NotoSansKhmer');
  static TextStyle txtManrope20Bold = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'NotoSansKhmer');

  static TextStyle txtTitle25Bold = const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold,);
  static TextStyle txtTitle20Bold = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,);

  static TextStyle txt16WhiteBold = const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold,);
  static TextStyle txt16GreyBold = const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold,);
  static TextStyle txt16Bold = const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,);
  static TextStyle txt16RedBold = const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold,);
  static TextStyle txt16PrimaryColorBold = TextStyle(fontSize: 16, color: primaryColor, fontWeight: FontWeight.bold,);
  static TextStyle txt18White = const TextStyle(fontSize: 18, color: Colors.white,);
  static TextStyle txt18Bold = const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold,);
  static TextStyle txt18Grey = const TextStyle(fontSize: 18, color: Colors.grey,);
  static TextStyle txt18PrimaryColorBold = TextStyle(fontSize: 18, color: primaryColor, fontWeight: FontWeight.bold,);
  static TextStyle txt20Bold = const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold,);
  static TextStyle txt20GreyBold = const TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold,);
  static TextStyle txt20PrimaryColorBold = TextStyle(fontSize: 20, color: primaryColor, fontWeight: FontWeight.bold,);
  static TextStyle txt25PrimaryColorBold = TextStyle(fontSize: 25, color: primaryColor, fontWeight: FontWeight.bold,);
  static TextStyle txt25WhiteBold = const TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,);
  static TextStyle txt25Bold = const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold,);

  static Color shadowColor = const Color.fromRGBO(149, 157, 165, 0.2);

  static BoxShadow defaultShadow = const BoxShadow(
    color: Color.fromRGBO(149, 157, 165, 0.2),
    blurRadius: 20,
    offset: Offset(0, 0),
  );

  static TextStyle txtFAS({
    double? size = 25,
    Color? color = Colors.black,
    FontWeight? fontWeight = FontWeight.bold,
  }) => TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: 'FAS'
  );

  static TextStyle txtFAR({
    double? size = 25,
    Color? color = Colors.black,
    FontWeight? fontWeight = FontWeight.bold,
  }) => TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: 'FAR'
  );

  static TextStyle txtFAD({
    double? size = 25,
    Color? color = Colors.black,
    FontWeight? fontWeight = FontWeight.bold,
  }) => TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: 'FAD'
  );
}