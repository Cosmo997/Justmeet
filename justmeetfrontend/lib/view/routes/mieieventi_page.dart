import 'package:flutter/material.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/view_event_widget.dart';


class MieiEventiPage extends StatefulWidget{
  @override
    MieiEventiPageState createState() => MieiEventiPageState();
  }

class MieiEventiPageState extends State<MieiEventiPage>{
  UserController userController = new UserController(); 
  EventoController eventoController = new EventoController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:JMAppBar(),
    body: ViewEvent(isLogged: true),
    );             

  }
}