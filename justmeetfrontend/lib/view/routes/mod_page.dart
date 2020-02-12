import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/theme.dart';


class ModPage extends StatefulWidget{
  @override
    ModPageState createState() => ModPageState();
  }

class ModPageState extends State<ModPage>{
  final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
     appBar:AppBar(
               backgroundColor: ThemeHandler.jmTheme().primaryColor,
               elevation: 10,
               title: Image.asset('assets/images/logo.png', scale: 2.5),
               centerTitle: true,
               ),
    body: FutureBuilder(
      future: ControllerJM.loadEventsToBeApproved(),
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
        else if(snapshot.data.length == 0){
         return Container(
          child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Non ci sono eventi da approvare"),
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
                                      Text((evento.partecipanti - evento.iscrizioni.length).toString()),
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
                                    Icon(Icons.place, color: ThemeHandler.jmTheme().accentColor),
                                    Text("Comune: " +evento.idComune),
                                   Divider(indent: 30, endIndent: 30, height: 10, thickness: 2,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    RaisedButton.icon(
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                ),
                                      color: ThemeHandler.jmTheme().accentColor,
                                      icon: Icon(Icons.check_circle_outline),
                                      label: Text("Apporva"),
                                     onPressed:() {
                                       setState(() {
                                        ControllerJM.approvaEvento(evento.id);
                                        snapshot.data.removeAt(index);
                                        showDialog(
                                           context: context,
                                          builder: (BuildContext context) {
                                         return AlertDialog(
                                         title: Text("Evento Approvato con successo"),
                                   );
                                    }
                                    );    
                                       });
                                      },
                                     ),
                                     RaisedButton.icon(
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                ),
                                      color: ThemeHandler.jmTheme().accentColor,
                                      icon: Icon(Icons.check_circle_outline),
                                      label: Text("Rifiuta"),
                                     onPressed:() {
                                       setState(() {
                                        ControllerJM.rifiutaEvento(evento.id);
                                        snapshot.data.removeAt(index);
                                        showDialog(
                                           context: context,
                                          builder: (BuildContext context) {
                                         return AlertDialog(
                                         title: Text("Evento Rifiutato"),
                                   );
                                    }
                                    );    
                                       });
                                      },
                                     ),
                                  ],
                                ),
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
    );             

  }
}

                             