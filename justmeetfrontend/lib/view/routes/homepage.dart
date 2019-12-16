import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:justmeet/classi/evento.dart';
//import 'dart:async';

class HomePage extends StatefulWidget{
  @override
    HomePageState createState() => HomePageState();
  }

class HomePageState extends State<HomePage>{
 
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

  @override
  void initState() {
    loadEvent();
    super.initState();
  }
     
      @override
      Widget build(BuildContext context) {
    
        return Scaffold(
                  appBar:AppBar
                  (
                   backgroundColor: Colors.black54,
                   elevation: 10,
                   title: Image.asset('assets/logo.png', scale: 2.5),
                   centerTitle: true,
                   ),
                  body: ListView.separated(
                      itemCount: eventList.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (BuildContext context, int index){
                        Evento evento = eventList[index];
                        return ListTile(
                          title: Text(evento.nome),
                          subtitle: Text(evento.desc),
                        );
                      },
                    ),
                  bottomNavigationBar: CurvedNavigationBar(
                                color: Colors.black54,
                                backgroundColor: Colors.white24,
                                buttonBackgroundColor: Colors.black54,
                                items: <Widget>[
                                  Icon(Icons.favorite, size: 18,),
                                  Icon(Icons.home, size: 18,),
                                  Icon(Icons.message, size: 18,),
                                  Icon(Icons.add_circle_outline, size: 18),
                                ],
                                animationDuration: Duration(
                                  milliseconds: 300,
                                ),
                                
                                index: 1,
                                onTap: (index){
                                  print("Current Index: $index");
                                },
                                
                              ),
                    
                    
                    );
                
      }  
    }
    
   