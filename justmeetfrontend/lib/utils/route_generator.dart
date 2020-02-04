import 'package:flutter/material.dart';
import 'package:justmeet/app.dart';
import 'package:justmeet/view/authentication/login.dart';
import 'package:justmeet/view/authentication/singin.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/singin':
        return MaterialPageRoute(builder: (_) => SinginPage());
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
