import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/authentication/singin_page.dart';
import 'package:justmeet/widget/appbar_widget.dart';
import 'package:justmeet/widget/drawer_widget.dart';

class GuestHomePage extends StatefulWidget{
  @override
    GuestHomePageState createState() => GuestHomePageState();
  }

class GuestHomePageState extends State<GuestHomePage>{
  final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:JMAppBar(),
    drawer: JMDrawer(),
    //ControllerJM.loadEventsApproved(),

    body: FutureBuilder(
      future: ControllerJM.loadEventsApproved(),
      builder: (BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
        if(snapshot.data == null)
        {
        return Container(
          child: Center(
                  child:CircularProgressIndicator()
                    )
        );
        }
        else
        {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Evento evento = snapshot.data[index];
              return  SingleChildScrollView(
                        child: Container(
                          child: Center(
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              color: ThemeHandler.jmTheme().secondaryHeaderColor,
                              elevation: 10,
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: CircleAvatar(
                                      child:Image.asset('assets/images/iconaUser.png'),
                                    ),
                                    title: Text(evento.titolo),
                                    subtitle: Text(evento.idCreatore),
                                  ),
                                   Divider(indent: 30, endIndent: 30, height: 10, thickness: 2,),
                                   Text("Descrizione", style: TextStyle(fontSize: 18), ),
                                   Container(
                                     height: 150,
                                     width: 1000,  
                                     child: Card(
                                       color: Colors.grey,
                                       margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                                       child: SingleChildScrollView(
                                         child: Padding(
                                           padding: const EdgeInsets.all(10.0),
                                           child: Text(evento.descrizione),
                                         )),
                                     ),
                                   ),
                                   Divider(indent: 30, endIndent: 30, height: 10, thickness: 2,),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                      Icon(Icons.people, color: ThemeHandler.jmTheme().accentColor,),
                                      Text("Posti rimanenti: "),
                                      Text((evento.partecipanti- evento.iscrizioni.length).toString()),
                                      Icon(Icons.category,  color: ThemeHandler.jmTheme().accentColor),
                                      Text(" Topic: "),
                                      Text(evento.idTopic),
                                    ],),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                      Icon(Icons.calendar_today,  color: ThemeHandler.jmTheme().accentColor),
                                      Text(_df.format(evento.inizioEvento)),
                                      Icon(Icons.calendar_today,  color: ThemeHandler.jmTheme().accentColor),
                                      Text(_df.format(evento.inizioEvento)),
                                    ],),
                                  ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(Icons.place, color: ThemeHandler.jmTheme().accentColor),
                                          Text("Comune: " +evento.idComune),
                                        ],
                                      )),
                                ],
                              )
                            ),
                          ),
                        ),
                        );
                      },
            itemCount: snapshot.data.length,
            separatorBuilder: (context, index) => Divider(indent: 30, endIndent: 30, thickness: 2),
            );
        }

        },
    ),
    //TODO Spostare in singin_button_widget.dart
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

