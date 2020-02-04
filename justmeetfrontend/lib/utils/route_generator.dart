import 'package:flutter/material.dart';
import 'package:justmeet/app.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/view/authentication/login.dart';
import 'package:justmeet/view/authentication/singin.dart';
import 'package:justmeet/view/routes/eventhandler.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/singin':
        return MaterialPageRoute(builder: (_) => SinginPage());
      case '/eventhandler':
      if(settings.arguments is Evento)
        return MaterialPageRoute(builder: (_) => EventHandlerPage(currentEvent: settings.arguments as Evento));
      return _errorRoute();
      
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
