import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/model/user.dart';
import 'package:justmeet/utils/controllerAPI/evento_controller.dart';
import 'package:justmeet/utils/controllerAPI/user_controller.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:justmeet/utils/theme.dart';


class UserHomePage extends StatefulWidget{
  @override
    UserHomePageState createState() => UserHomePageState();
  }

class UserHomePageState extends State<UserHomePage>{
  EventoController eventoController = new EventoController();
  UserController userController = new UserController(); 
  final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
   bool isButtonEnabled = false;
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      future: eventoController.loadEventsApproved(),
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
                                      child:Image.asset('assets/images/iconaUser.png'),
                                    ),
                                    title: Text(evento.titolo),
                                    subtitle: Text(evento.idCreatore),
                                    trailing: FutureBuilder(
                                      future: userController.getUserById(AuthProvider.getUId()),
                                      builder: (context, AsyncSnapshot<User> user) {
                                        if(user.data == null)
                                         return CircularProgressIndicator();
                                        else 
                                        if(user.data.preferiti.contains(evento.id))
                                        {
                                          return                                   
                                        GestureDetector(
                                          child: Icon(Icons.favorite, color: ThemeHandler.jmTheme().accentColor),
                                          onTap: () {
                                            setState(() {
                                               userController.deletePreferito(AuthProvider.getUId(), evento.getId());
                                             showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Rimozione Preferito"),
          content: new Text("Questo evento non farà più parte dei tuoi Eventi Preferiti"),
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
                                        }
                                        else
                                        return
                                        GestureDetector(
                                          child: Icon(Icons.favorite_border, color: ThemeHandler.jmTheme().accentColor),
                                          onTap: () {
                                            setState(() {
                                               userController.addPreferito(AuthProvider.getUId(), evento.getId());
                                             showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Aggiunta Preferito"),
          content: new Text("Evento aggiunto ai preferiti"),
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
                                    )
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
                                      Text(" Partecipanti: "),
                                      Text(evento.partecipanti.toString()),
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
                                    FutureBuilder(
                                      future: AuthProvider.getUId(),
                                      builder: (context, AsyncSnapshot<String> snapshot) {
                                      if(snapshot.data == null)
                                        return CircularProgressIndicator();
                                      else if (evento.iscrizioni.contains(snapshot.data))
                                        return RaisedButton.icon(
                                          shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                ),
                                icon: Icon(Icons.remove_circle_outline),
                                label: Text("Rimuovi Iscrizione"),
                                 color: ThemeHandler.jmTheme().accentColor,
                                      onPressed: ()  {
                                        setState(() {
                                              eventoController.deleteIscrizione(evento.id, snapshot.data);
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
                                        eventoController.addIscrizione(evento.id, snapshot.data);
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

