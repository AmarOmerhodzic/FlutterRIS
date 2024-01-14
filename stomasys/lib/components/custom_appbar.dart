import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stomasys/constants/color.dart';

class AppBarWithBackIcon extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onPressed;

  AppBarWithBackIcon({ this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.primaryBlue,
      title: Text(title?? ''),
      centerTitle: true,
      leading: onPressed != null ? IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onPressed,
      ) : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}