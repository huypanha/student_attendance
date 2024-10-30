import 'package:flutter/material.dart';

class FeatureModel {
  final String title;
  final Widget icon;
  final String routeName;

  const FeatureModel({
    required this.title,
    required this.icon,
    required this.routeName,
  });
}