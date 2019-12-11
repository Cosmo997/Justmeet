import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget{
  @override
    HomePageState createState() => HomePageState();
  }

class HomePageState extends State<HomePage>{
 
  var eventList = [];

   loadEvent() async {
    //var url = "http://www.mocky.io/v2/5df10ee6310000487b8f0da4";
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
    
        var appBarIniziale = AppBar(
                  backgroundColor: Colors.black54,
                  elevation: 10,
                  title: Image.asset('assets/logo.png', scale: 2.5),
                  centerTitle: true,
                );
    
        return new Scaffold(
          
            appBar: appBarIniziale,
            body: ListView.separated(
              itemCount: eventList.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (BuildContext context, int index){
                Evento evento = eventList[index];
                return ListTile(
                  title: Text(evento.titolo),
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
    
    class Evento {
      final String id;
      final String titolo;
      final String desc;
    
      Evento(this.id, this.titolo, this.desc);
    
      Evento.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      titolo = json['titolo'],
      desc = json['desc'];
}