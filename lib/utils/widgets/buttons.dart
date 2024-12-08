import 'package:flutter/material.dart';

import '../../utils/utils.dart';

Widget primaryTextButton({
  required Function()? onPressed,
  required Widget child,
  double width = 130,
  Color? backgroundColor,
}) {
  backgroundColor ??= Style.primaryColor;

  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10,)),
      overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(.1)),
      minimumSize: WidgetStatePropertyAll(Size(width, 50)),
    ),
    child: child,
  );
}

Widget secondaryTextButton({
  required Function() onPressed,
  required Widget child,
  double width = 130,
  Color? borderColor,
}){
  borderColor ??= Style.primaryColor;

  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor,),
      )),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10,)),
      overlayColor: WidgetStatePropertyAll(borderColor.withOpacity(.1)),
      minimumSize: WidgetStatePropertyAll(Size(width, 50)),
    ),
    child: child,
  );
}

Widget textButton({
  required Function() onPressed,
  required Widget child,
  double width = 130,
  Color? backgroundColor = Colors.transparent,
  Color? overlayColor,
}){
  overlayColor ??= Style.primaryColor.withOpacity(.1);

  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10,)),
      overlayColor: WidgetStatePropertyAll(overlayColor),
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      minimumSize: WidgetStatePropertyAll(Size(width, 50)),
    ),
    child: child,
  );
}

Widget primaryElevatedButton({
  required Function() onPressed,
  required Widget child,
  double width = 130,
  Color? backgroundColor,
}) {
  backgroundColor ??= Style.primaryColor;

  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      foregroundColor: const WidgetStatePropertyAll(Colors.white),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10,)),
      overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(.1)),
      minimumSize: WidgetStatePropertyAll(Size(width, 50)),
    ),
    child: child,
  );
}