import 'package:flutter/material.dart';
import 'package:todos_app/ui/tools/app_colors.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  String title;
  MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: textColor2, fontSize: 26),),
      centerTitle: true,
      backgroundColor: backgroundColor,
    );
  }

  @override

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  }
