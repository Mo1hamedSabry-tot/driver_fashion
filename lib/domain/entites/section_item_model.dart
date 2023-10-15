import 'package:flutter/material.dart';

class SectionItemModel {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  SectionItemModel({
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  factory SectionItemModel.fromJson({required Map<String, dynamic> json}) {
    return SectionItemModel(
      iconData: json["iconData"],
      onTap: json["onTap"] ?? () {},
      title: json["title"],
    );
  }
}
