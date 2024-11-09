import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style.dart';

Widget textFormField({
  required TextEditingController controller,
  void Function(String value)? onChanged,
  String? Function(String value)? validator,
  bool enabled = true,
  String? hintText,
  List<TextInputFormatter>? inputFormatters,
  TextInputType? keyboardType,
  bool obscureText = false,
  void Function(String value)? onSubmitted,
  Widget? suffixIcon,
  Widget? prefixIcon,
  int? maxLines,
  int? maxLength,
  InputBorder? border,
  TextAlign textAlign = TextAlign.start,
  bool autoFocus = true,
}) => TextFormField(
  controller: controller,
  autofocus: autoFocus,
  obscureText: obscureText,
  onChanged: onChanged,
  validator: (v) {
    return validator?.call(v!);
  },
  onFieldSubmitted: onSubmitted,
  enabled: enabled,
  inputFormatters: inputFormatters,
  keyboardType: keyboardType,
  maxLines: maxLines ?? 1,
  maxLength: maxLength,
  textAlign: textAlign,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    hintText: hintText,
    hintStyle: Style.txt16Grey,
    border: border ?? OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300]!,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: border ?? OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300]!,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    counter: const SizedBox(),
  ),
);