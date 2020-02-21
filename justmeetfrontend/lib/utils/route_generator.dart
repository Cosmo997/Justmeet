import 'package:flutter/material.dart';
import 'package:justmeet/app.dart';
import 'package:justmeet/view/authentication/singin_page.dart';
import 'package:justmeet/view/authentication/signup_page.dart';
import 'package:justmeet/view/routes/eventi_sub_page.dart';
import 'package:justmeet/view/routes/mod_page.dart';
import 'package:justmeet/view/routes/mieieventi_page.dart';
import 'package:justmeet/view/routes/preferiti_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/login':
        return MaterialPageRoute(builder: (_) => SinginPage());
      case '/mieieventi':
        return MaterialPageRoute(builder: (_) => MieiEventiPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/approva':
        return MaterialPageRoute(builder: (_) => ModPage());
      case '/preferiti':
        return MaterialPageRoute(builder: (_) => PreferitiPage());
      case '/sub':
        return MaterialPageRoute(builder: (_) => EventiSubPage());

      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('Error'),),
        body: Center(child: Text('ERROR'),
        ),
      );
    });
  }
}
