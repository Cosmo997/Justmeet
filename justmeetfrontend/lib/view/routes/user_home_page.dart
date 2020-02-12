import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/widget/view_event_widget.dart';


class UserHomePage extends StatefulWidget{
  @override
    UserHomePageState createState() => UserHomePageState();
  }

class UserHomePageState extends State<UserHomePage>{
  EventoController eventoController = new EventoController();
  UserController userController = new UserController(); 
  final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
  bool isLogged = true;
  
  @override
  Widget build(BuildContext context) {
    return ViewEvent(isLogged: true,);      
  }
}

