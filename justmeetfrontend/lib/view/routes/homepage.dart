import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../classi/evento.dart';
import 'eventcreator.dart';

//import 'dart:async';

class HomePage extends StatefulWidget{
  @override
    HomePageState createState() => HomePageState();
  }

class HomePageState extends State<HomePage>{
 
  int currentIndex = 1;

  var eventList = [];

   loadEvent() async {
    String urlSpring = "https://springboot-restapi.herokuapp.com/eventi";
    http.Response response = await http.get(Uri.encodeFull(urlSpring), headers: {"Accept" : "application/json"});
    print("Risposta ricevuta");
    print("Body: " +response.body);
    List collection = json.decode(response.body);
    List<Evento> eventi = collection.map((json) => Evento.fromJson(json)).toList();

    setState(() {
      eventList = eventi;
    });  

  }  

  Widget callPageBody(int index){
    switch (index) 
    {
      case 0: return HomePage();
      case 1: return EventCreator();
        
        break;
      default: return HomePage();
    }
  }


  @override
  void initState() {
    loadEvent();
    super.initState();
  }
     
      @override
      Widget build(BuildContext context) {
    
        return Scaffold(
                  body: ListView.separated(
                      itemCount: eventList.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (BuildContext context, int index){
                        Evento evento = eventList[index];
                        return  SingleChildScrollView(
                          child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
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
                                subtitle: Text("\nRegione: "+evento.luogo.regione+"\nProvincia: " +evento.luogo.provincia),
                                trailing: Text("Numero partecipanti: " +evento.partecipanti.toString()+
                                 "\n\nTopic:" +evento.topic.argomento),
                              ),
                                  ],),
                                ),
                              ),
                              RaisedButton(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.black)
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
    
   