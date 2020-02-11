import 'package:flutter/material.dart';
import 'package:justmeet/app.dart';
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/view/authentication/singin_page.dart';
import 'package:justmeet/view/authentication/signup_page.dart';
import 'package:justmeet/view/routes/mod_page.dart';
import 'package:justmeet/view/routes/mieieventi_page.dart';
import 'package:justmeet/view/routes/preferiti_page.dart';
import 'package:justmeet/widget/vista_eventi_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/login':
        return MaterialPageRoute(builder: (_) => SinginPage());
      case '/ricerca':
      if(args is Future<List<Evento>>)
      return MaterialPageRoute(builder: (_) =>VistaEventiWidget(events: args));
      return _errorRoute();
      case '/mieieventi':
        return MaterialPageRoute(builder: (_) => MieiEventiPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/approva':
        return MaterialPageRoute(builder: (_) => ModPage());
      case '/preferiti':
        return MaterialPageRoute(builder: (_) => PreferitiPage());

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
