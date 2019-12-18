import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:justmeet/controllerjm.dart';

//import 'package:justmeet/controllerjm.dart';

import '../../classi/evento.dart';
import '../../classi/luogo.dart';
import '../../classi/topic.dart';



class HomePage extends StatefulWidget{
  @override
    HomePageState createState() => HomePageState();
  }

class HomePageState extends State<HomePage>{
 
  int currentIndex = 1;
  Future<List<Evento>> eventi = ControllerJM.loadEvent();
  var eventList = [
    new Evento("id", "titolo", "desc", 3, new Topic("id", "argomento"), new Luogo(), "idCreatore"),
    new Evento("id", "titolo", "desc", 3, new Topic("id", "argomento"), new Luogo(), "idCreatore"),
    new Evento("id", "titolo", "desc", 3, new Topic("id", "argomento"), new Luogo(), "idCreatore"),
    new Evento("id", "titolo", "desc", 3, new Topic("id", "argomento"), new Luogo(), "idCreatore"),
  ];

  

  @override
  void initState() {
    super.initState();
  }
     
      @override
      Widget build(BuildContext context) {
    
        return Scaffold(
                  body: ListView.separated(
                      itemCount: eventList.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (BuildContext context, int index){
                        Evento evento = eventi;
                        return  SingleChildScrollView(
                          child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(evento.titolo),
                                  subtitle: Text(evento.desc),
                                  trailing: Icon(Icons.favorite_border), onTap: () => {}
                                  //Se loggato, salva l'evento tra i preferiti.
                                ),
                              Card(
                                elevation: 5,
                                color: Colors.white,
                                margin: EdgeInsets.all(40),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                       ListTile(
                                title: Text("\n Nome: \nCognome: "),
                                subtitle: Text("\nRegione: " "\nProvincia: "),
                                trailing: Text("Numero partecipanti: " "\n\nTopic:"),
                              ),
                                  ],),
                                ),
                              ),
                              RaisedButton(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.grey)
                                ),

                                child: Text("ISCRIVITI"),
                                onPressed: ()=>{}
                                //,
                              ),
                            ],
                            ),
                          ),
                        ),
                        );
                      },
                    ),
                    );
                
      }  
    }
    
   