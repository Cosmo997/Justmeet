import 'package:flutter/material.dart';
import 'package:justmeet/app.dart';
import 'package:justmeet/view/authentication/login.dart';
import 'package:justmeet/view/routes/areariservata.dart';
import 'package:justmeet/view/routes/eventcreator.dart';
import 'package:justmeet/view/routes/homepage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/creaevento':
        return MaterialPageRoute(builder: (_) => EventCreator());
        // // Validation of correct data type
        // if (args is bool) {
        //   return MaterialPageRoute(builder: (_) => EventCreator(),
        //   );
        // }
        // return _errorRoute();
      case '/areariservata':
        return MaterialPageRoute(builder: (_) => AreaRiservata());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

        
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
