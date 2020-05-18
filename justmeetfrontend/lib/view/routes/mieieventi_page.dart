import 'package:flutter/material.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:justmeet/utils/controllerAPI/evento_token_controller.dart';
import 'package:justmeet/utils/viewtype.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/view_event_widget.dart';


class MieiEventiPage extends StatefulWidget{
  @override
    MieiEventiPageState createState() => MieiEventiPageState();
  }

class MieiEventiPageState extends State<MieiEventiPage>{
  EventoTokenController eventoTokenController = new EventoTokenController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:JMAppBar(),
    body: ViewEvent(type: ViewType.MYEVENT, events: eventoTokenController.loadEventiByIdCreatore(AuthProvider.getUId(), AuthProvider.getToken()),),
    );             
  }
}