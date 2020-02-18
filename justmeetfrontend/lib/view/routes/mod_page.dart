import 'package:flutter/material.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/viewtype.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/view_event_widget.dart';


class ModPage extends StatefulWidget{
  @override
    ModPageState createState() => ModPageState();
  }

class ModPageState extends State<ModPage>{
  EventoController eventoController = new EventoController();
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar:JMAppBar(),
      body:ViewEvent(type: ViewType.MOD, events: eventoController.loadEventsToBeApproved()),
  );           

  }
}

                             