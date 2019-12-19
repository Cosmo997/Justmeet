import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../../classi/evento.dart';


class HomePageTest extends StatefulWidget {
 
    @override
    HomePageTestState createState() => HomePageTestState();
  }
    
  class HomePageTestState extends State<HomePageTest>{
    List<Evento> eventsFromSpring = [];
    bool isLoading = true;

  Future getEventBySpring() async {
    http.Response response = await http.get("https://springboot-restapi.herokuapp.com/eventi");

    await Future.delayed(Duration(milliseconds: 300));

    List collection = json.decode(response.body);
    List<Evento> _eventsFromSpring = collection.map((json) => Evento.fromJson(json)).toList();

    setState(() {
      eventsFromSpring = _eventsFromSpring;
      isLoading = false;
    });

  }

  void initState(){
    getEventBySpring();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Center(
        child: CircularProgressIndicator())
      : ListView.separated(
                      itemCount: eventsFromSpring.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (BuildContext context, int index){
                        Evento evento = eventsFromSpring[index];
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
                                title: Text(evento.inizioEvento.toIso8601String()),
                                subtitle: Text(evento.fineEvento.toIso8601String()),
                                trailing: Text("Numero partecipanti:"+evento.partecipanti.toString() +"\n\nTopic:"),
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
      )
    );
  }
}