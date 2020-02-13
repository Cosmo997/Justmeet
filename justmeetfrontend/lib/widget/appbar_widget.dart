import 'package:flutter/material.dart';
import 'package:justmeet/utils/theme.dart';

class JMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JMAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ThemeHandler.jmTheme().primaryColor,
        elevation: 10,
        title: Image.asset('assets/images/logo.png', scale: 2.5),
        centerTitle: true,
        );
  }

  @override
  
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}