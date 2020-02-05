import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/routes/eventhandler.dart';




class MieiEventi extends StatefulWidget{
  @override
    MieiEventiState createState() => MieiEventiState();
  }

class MieiEventiState extends State<MieiEventi>{
  final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    
    body: FutureBuilder(
      future: ControllerJM.loadEvents(),
      builder: (BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
        if(snapshot.data == null)
        {
        return Container(
          child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("LOADING", style: TextStyle(color: ThemeHandler.jmTheme().accentColor),),
                      Divider(color: ThemeHandler.jmTheme().accentColor, height: 30,indent: 50 ,endIndent: 50,),
                      CircularProgressIndicator(),
                    ],
                  ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ListTile(
                                  title: Text(evento.titolo),
                                  leading: Icon(Icons.event_available),
                                  trailing: Icon(Icons.more_horiz),
                                ),
                                Divider(indent: 30, endIndent: 30, height: 10,),
                                Text(evento.descrizione, maxLines: 5,),
                                Divider(indent: 30, endIndent: 30, height: 10,),
                                ListTile(
                                  title: Text(evento.partecipanti.toString()),
                                  leading: Icon(Icons.people),
                                  trailing: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Icon(Icons.calendar_today),
                                        Text(_df.format(evento.inizioEvento)),
                                        Icon(Icons.calendar_today),
                                        Text(_df.format(evento.fineEvento)),
                                      ],
                                      ),
                                     Divider(indent: 30, endIndent: 30, height: 10,),
                                     Row(
                                       children: <Widget>[
                                         Icon(Icons.favorite_border),
                                         GestureDetector(
                                           child: Text("Save"),
                                           onTap: () {
                                             //Cambio colore del cuore e salvo evento tra i preferiti
                                           },
                                         ),
                                         Icon(Icons.check_circle_outline),
                                         GestureDetector(
                                           child: Text("Iscriviti"),
                                           onTap: () {
                                             //Cambio icona senza outline con colore del tema e iscrivo l'user
                                           },
                                         ),
                                        
                                       ],)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        );
                      },
            itemCount: snapshot.data.length,
            separatorBuilder: (context, index) => Divider(),
            );
        }
        },
    ),
    );             

  }
}