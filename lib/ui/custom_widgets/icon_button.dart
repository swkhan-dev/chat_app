import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/colors.dart';

class AppBarIconButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData iconData;
  AppBarIconButton({this.iconData = Icons.search, this.onTap});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: kHeadingButtonColor,
        size: 28,
      ),
      splashRadius: 24.0,
      onPressed: onTap,
    );
  }
}
