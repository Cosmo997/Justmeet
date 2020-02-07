import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/classi/user.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/theme.dart';


class Preferiti extends StatefulWidget {

  @override
  PreferitiState createState() => PreferitiState();
}

class PreferitiState extends State<Preferiti>
{
    final DateFormat _df = DateFormat("H:m dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      future: ControllerJM.loadPreferitiByUtente(AuthProvider.getUId()),
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
        if(snapshot.data.length == 0)
        {
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Non hai preferiti")
                ],
              ),
            ),
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
                                    trailing: FutureBuilder(
                                      future: ControllerJM.getUserById(AuthProvider.getUId()),
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
                                               ControllerJM.deletePreferito(AuthProvider.getUId(), evento.getId());
                                             showDialog(
                                               context: context,
                                          builder: (BuildContext context) {
                                         return AlertDialog(
                                         title: Text("Rimozione dai preferiti avvenuta con successo"),
                                   );
                            }
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
                                               ControllerJM.addPreferito(AuthProvider.getUId(), evento.getId());
                                             showDialog(
                                               context: context,
                                          builder: (BuildContext context) {
                                         return AlertDialog(
                                         title: Text("Evento aggiunto ai preferiti"),
                                   );
                            }
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
                                              ControllerJM.deleteIscrizione(evento.id, snapshot.data);
                                              showDialog(
                                           context: context,
                                          builder: (BuildContext context) {
                                         return AlertDialog(
                                         title: Text("Rimozione iscrizione avvenuta con successo"),
                                         elevation: 10,
                                        
                                   );
                            }
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
                                        ControllerJM.addIscrizione(evento.id, snapshot.data);
                                        showDialog(
                                           context: context,
                                          builder: (BuildContext context) {
                                         return AlertDialog(
                                         title: Text("Iscrizione avvenuta con successo"),
                                   );
                            }
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
    )
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