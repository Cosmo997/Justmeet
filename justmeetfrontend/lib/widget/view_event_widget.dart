import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/utils/viewtype.dart';
import 'package:justmeet/widget/no_data_widget.dart';

import 'load_name_widget.dart';
import 'loading_widget.dart';

class ViewEvent extends StatefulWidget{
  final ViewType type;
  final Future<List<Evento>> events;

  const ViewEvent({Key key, @required this.type, @required this.events}) : super(key: key);
 
  @override
  ViewEventState createState() => ViewEventState(this.type, this.events);
  }
  
  class ViewEventState extends State<ViewEvent> {

  final ViewType type;
  final Future<List<Evento>> events;

    
      EventoController eventoController = new EventoController();
      UserController userController = new UserController(); 
      final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
    
      ViewEventState(this.type, this.events);
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: FutureBuilder(
          future: events,
          builder: (BuildContext context, AsyncSnapshot<List<Evento>> eventi) {
            if(eventi.data == null){return LoadingWidget();}
            if(eventi.data.length == 0){return NoDataWidget();}
            else{
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
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
                                          backgroundColor: Colors.black,
                                          child:Image.asset('assets/images/iconaUser.png'),
                                        ),
                                        title: Text(eventi.data[index].titolo),
                                        subtitle: LoadName(idCreatore: eventi.data[index].idCreatore),
                                        trailing: Builder(
                                            builder: (context) {
                                              switch (type) {
                                                case ViewType.MYEVENT: 
                                                return GestureDetector(
                                                  child: Icon(Icons.delete_forever,size: 30 ,color: ThemeHandler.jmTheme().accentColor),
                                                  onTap: () {
                                                    setState(() {
                                                      eventoController.rifiutaEvento(eventi.data[index].getId());
                                                      eventi.data.removeAt(index);
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: new Text("Evento Rimosso con successo"),
                                                          actions: <Widget>[
                                                            new FlatButton(
                                                              child: new Text("Close"),
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );    
                                              });
                                                  },
                                                );
                                                case ViewType.GUEST_HOME: return Text("");
                                                default: return FutureBuilder(
                                              future: userController.getUserById(AuthProvider.getUId()),
                                              builder: (context, AsyncSnapshot<User> user) {
                                                if(user.data == null) return CircularProgressIndicator();
                                                else 
                                                if(user.data.preferiti.contains(eventi.data[index].id))
                                                return GestureDetector(
                                                  child: Icon(Icons.favorite, color: ThemeHandler.jmTheme().accentColor),
                                                  onTap: () {
                                                    setState(() {
                                                      userController.deletePreferito(AuthProvider.getUId(), eventi.data[index].getId());
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: new Text("Rimozione Preferito"),
                                                          content: new Text("Questo evento non farà più parte dei tuoi Eventi Preferiti"),
                                                          actions: <Widget>[
                                                            new FlatButton(
                                                              child: new Text("Close"),
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                  },
                                                );
                                              });
                                                  },
                                                );
                                                else
                                                return GestureDetector(
                                                  child: Icon(Icons.favorite_border, color: ThemeHandler.jmTheme().accentColor),
                                                  onTap: () {
                                                    setState(() {
                                                      userController.addPreferito(AuthProvider.getUId(), eventi.data[index].getId());
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return AlertDialog(
                                                          title: new Text("Aggiunta Preferito"),
                                                          content: new Text("Evento aggiunto ai preferiti"),
                                                          actions: <Widget>[
                                                            new FlatButton(
                                                              child: new Text("Close"),
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );    
                                              });
                                                  },
                                                );
                                              },
                                            );
                                              }
                                            },
                                          )
                                        ),
                                      Divider(indent: 30, endIndent: 30, height: 10, thickness: 2,),
                                      Text("Descrizione", style: TextStyle(fontSize: 18), ),
                                      Container(
                                         height: 150,
                                         width: 1000,  
                                         child: Card(
                                           color: ThemeHandler.jmTheme().scaffoldBackgroundColor,
                                           margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                                           child: SingleChildScrollView(
                                             child: Padding(
                                               padding: const EdgeInsets.all(5.0),
                                               child: Text(eventi.data[index].descrizione),
                                             )),
                                         ),
                                       ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Icon(Icons.people, color: ThemeHandler.jmTheme().accentColor,),
                                              Row(
                                                children: <Widget>[
                                                  Text("Posti liberi: "),
                                                   Text((eventi.data[index].partecipanti - eventi.data[index].iscrizioni.length).toString()),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Icon(Icons.category,  color: ThemeHandler.jmTheme().accentColor),
                                              Row(
                                                children: <Widget>[
                                                  Text("Topic: "),
                                                  Text(eventi.data[index].idTopic),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Icon(Icons.calendar_today,  color: ThemeHandler.jmTheme().accentColor),
                                              Text(_df.format(eventi.data[index].inizioEvento)),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Icon(Icons.calendar_today,  color: ThemeHandler.jmTheme().accentColor),
                                               Text(_df.format(eventi.data[index].fineEvento)),
                                            ],
                                          ),
                                        ],),
                                      ),
                                      Icon(Icons.place, color: ThemeHandler.jmTheme().accentColor),
                                      Text("Comune: " +eventi.data[index].idComune),
                                      Divider(indent: 30, endIndent: 30, height: 10, thickness: 2,),
                                      Builder(
                                        builder: (BuildContext context) { 
                                          switch (type) {
                                            case ViewType.MOD: return Row(
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
                                                      eventoController.approvaEvento(eventi.data[index].id);
                                                      eventi.data.removeAt(index);
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
                                                      eventoController.rifiutaEvento(eventi.data[index].id);
                                                      eventi.data.removeAt(index);
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
                                              );
                                            default: return Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Builder(
                                                  builder: (context) {
                                                    switch (type) {
                                                      case ViewType.GUEST_HOME: return Text("");
                                                      default: return FutureBuilder(
                                                        future: AuthProvider.getUId(),
                                                        builder: (context, AsyncSnapshot<String> snapshot) {
                                                          if(snapshot.data == null)
                                                            return CircularProgressIndicator();
                                                          else if (eventi.data[index].iscrizioni.contains(snapshot.data))
                                                            return Column(
                                                            children: <Widget>[
                                                              Divider(indent: 30, endIndent: 30, height: 10, thickness: 2,),
                                                              RaisedButton.icon(
                                                                shape: RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(10.0),
                                                                ),
                                                                icon: Icon(Icons.remove_circle_outline),
                                                                label: Text("Rimuovi Iscrizione"),
                                                                color: ThemeHandler.jmTheme().accentColor,
                                                                  onPressed: ()  {
                                                                        setState(() {
                                                                              eventoController.deleteIscrizione(eventi.data[index].id, snapshot.data);
                                                                              showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  // return object of type Dialog
                                                                                  return AlertDialog(
                                                                                    title: new Text("Rimozione Iscrizione Avvenita Con Successo"),
                                                                                    content: new Text("Ora non sei piu iscritto a questo evento"),
                                                                                    actions: <Widget>[
                                                                                      // usually buttons at the bottom of the dialog
                                                                                      new FlatButton(
                                                                                        child: new Text("Close"),
                                                                                        onPressed: () {
                                                                                          Navigator.of(context).pop();
                                                                          },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                              });                                        
                                                              },
                                                ),
                                                      ],
                                                    );
                                                    else if(eventi.data[index].partecipanti - eventi.data[index].iscrizioni.length == 00)
                                                      return RaisedButton.icon(
                                                        shape: RoundedRectangleBorder(
                                                        borderRadius: new BorderRadius.circular(10.0),
                                                        ),
                                                          color: ThemeHandler.jmTheme().accentColor,
                                                          icon: Icon(Icons.sentiment_dissatisfied, size: 30, color: Colors.white,),
                                                          label: Text("Evento al Completo"),
                                                          onPressed:() {}
                                                            );
                                                    else
                                                      return RaisedButton.icon(
                                                      shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.circular(10.0),
                                                      ),
                                                            color: ThemeHandler.jmTheme().accentColor,
                                                            icon: Icon(Icons.check_circle_outline),
                                                            label: Text("Partecipa"),
                                                          onPressed:() 
                                                          {
                                                            setState(() {
                                                              eventoController.addIscrizione(eventi.data[index].id, snapshot.data);
                                                            showDialog(
                                                                    context: context,
                                                                    builder: (BuildContext context) {
                                                                      // return object of type Dialog
                                                                      return AlertDialog(
                                                                        title: new Text("Iscrizione Avvenuta Con Successo"),
                                                                        content: new Text("Ora sei iscritto, continua a navigare"),
                                                                        actions: <Widget>[
                                                                          // usually buttons at the bottom of the dialog
                                                                          new FlatButton(
                                                                            child: new Text("Close"),
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ); 
                                                            });
                                                            },
                                                          );
                                           },
                                                );
                                              }
                                            },)
                                        ],
                                    );
                                          }
                                         },
                                      ),
                                    ],
                                  )
                                ),
                              ),
                            ),
                            );
                          },
                itemCount: eventi.data.length,
                separatorBuilder: (context, index) => Divider(indent: 30, endIndent: 30, thickness: 2),
                );
            }
            },
        ),
        );   
      }
    
    
}