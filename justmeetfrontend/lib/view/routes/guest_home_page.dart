import 'package:flutter/material.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/authentication/singin_page.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/drawer_widget.dart';
import 'package:justmeet/widget/view_event_widget.dart';

class GuestHomePage extends StatefulWidget{
  @override
    GuestHomePageState createState() => GuestHomePageState();
  }

class GuestHomePageState extends State<GuestHomePage>{
  EventoController eventoController = new EventoController();
  UserController userController = new UserController();
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:JMAppBar(),
    drawer: JMDrawer(),

    body: ViewEvent(isLogged: false),

    floatingActionButton: FloatingActionButton(
      backgroundColor: ThemeHandler.jmTheme().accentColor,
      child: Icon(Icons.account_box, color: ThemeHandler.jmTheme().primaryColor),
      onPressed: () => { 
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) { return FractionallySizedBox(
                    heightFactor: 0.9,
                    child: SinginPage()); },
                  isScrollControlled: true),
              }
            ));          
        
          }
        
        @override
        void initState() {super.initState();}
        
        
    
    }

