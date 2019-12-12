import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultAppbar extends StatelessWidget
{
  @override
  Widget build(BuildContext context) => AppBar(
                  backgroundColor: Colors.black54,
                  elevation: 10,
                  title: Image.asset('assets/logo.png', scale: 2.5),
                  centerTitle: true,
                );
  
  
}