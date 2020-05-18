import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:justmeet/utils/controllerAPI/evento_token_controller.dart';
import 'package:justmeet/utils/viewtype.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/view_event_widget.dart';

class PreferitiPage extends StatefulWidget {

  @override
  PreferitiPageState createState() => PreferitiPageState();
}

class PreferitiPageState extends State<PreferitiPage>
{
    EventoTokenController eventoTokenController = new EventoTokenController();
    //UserController userController = new UserController(); 

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: JMAppBar(),
    body: ViewEvent(type: ViewType.FAVORITE, events: eventoTokenController.loadPreferitiByUtente(AuthProvider.getUId(), AuthProvider.getToken()))
    );             
  }
}