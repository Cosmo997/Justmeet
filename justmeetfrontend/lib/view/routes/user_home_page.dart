import 'package:flutter/material.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/viewtype.dart';
import 'package:justmeet/widget/view_event_widget.dart';


class UserHomePage extends StatefulWidget{
  @override
    UserHomePageState createState() => UserHomePageState();
  }

class UserHomePageState extends State<UserHomePage>{
  EventoController eventoController = new EventoController();
  @override
  Widget build(BuildContext context) {
    return ViewEvent(type: ViewType.USER_HOME, events: eventoController.loadEventsApproved());      
  }
}

