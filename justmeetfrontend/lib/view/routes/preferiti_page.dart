import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/view_event_widget.dart';

class PreferitiPage extends StatefulWidget {

  @override
  PreferitiPageState createState() => PreferitiPageState();
}

class PreferitiPageState extends State<PreferitiPage>
{
    EventoController eventoController = new EventoController();
    UserController userController = new UserController(); 
    final DateFormat _df = DateFormat("H:m dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: JMAppBar(),
    //TODO Sostiuire body
    body: ViewEvent(isLogged: true,)
    );             
  }
      @override
      void initState() {
        super.initState();
      }
    
      @override
      void dispose() {
        super.dispose();
      }
 
}