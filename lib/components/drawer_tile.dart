import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final leading;
  final title;
  void Function()? onTap;
  DrawerTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      onTap: onTap,
    );
  }
}
