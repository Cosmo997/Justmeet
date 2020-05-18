import 'package:flutter/material.dart';
import 'package:justmeet/utils/controllerAPI/evento_token_controller.dart';
import 'package:justmeet/utils/viewtype.dart';
import 'package:justmeet/widget/view_event_widget.dart';


class UserHomePage extends StatefulWidget{
  @override
    UserHomePageState createState() => UserHomePageState();
  }

class UserHomePageState extends State<UserHomePage>{
  EventoTokenController eventoTokenController = new EventoTokenController();
  @override
  Widget build(BuildContext context) {
    return ViewEvent(type: ViewType.USER_HOME, events: eventoTokenController.loadEventsApproved());      
  }
}

