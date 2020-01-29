import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/utils/theme.dart';

class NavigationBar extends StatefulWidget {
  final int currentIndex;
  NavigationBar({Key key, @required this.currentIndex}) : super(key: key);
  

  @override
  _NavigationBarState createState() => _NavigationBarState(currentIndex);
}

class _NavigationBarState extends State<NavigationBar> {

  final int currentIndex;
  var pageIcons = [
            Icon(Icons.home, size: 30),
            Icon(Icons.add_circle, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.accessible_forward, size: 30),   
                  ];

  _NavigationBarState(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50,
      color: ThemeHandler.jmTheme().primaryColor,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: ThemeHandler.jmTheme().primaryColor,  
      items: pageIcons,
      animationDuration: Duration(milliseconds: 600),
      index: currentIndex,
      onTap: (index){setState(() {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacementNamed('/');
            break;
          case 1:
            Navigator.of(context).pushReplacementNamed('/creaevento');
            break;
          case 2:
          Navigator.of(context).pushReplacementNamed('/login');
          break;
          case 3:
          Navigator.of(context).pushReplacementNamed('/areariservata');
          break;
          default:
          Navigator.of(context).pushReplacementNamed('/error');
          break;

        }

      });
      });
      }
  }