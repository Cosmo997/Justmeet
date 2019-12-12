import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/classi/user.dart';

class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>
  {
      Evento event;

      TextEditingController usrController = TextEditingController();
      TextEditingController pswController = TextEditingController();
      //User author;
      
@override
  void initState() {
    newEventState();
    super.initState();
  }

void newEventState()
{
  event = null;
  //author = null;
}

   @override
    Widget build(BuildContext context)
    {
     return Scaffold(

      appBar:AppBar(
                   backgroundColor: Colors.black54,
                   elevation: 10,
                   title: Image.asset('assets/logo.png', scale: 2.5),
                   centerTitle: true,
                   ),

      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        
         children: <Widget>[

          Container(
            
            child: Text("Inserisci qui un nome significativo per l'evento:",
              textAlign: TextAlign.left,
            ),
            ),

          Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                maxLength: 50,
                decoration: InputDecoration(
                    focusColor: Colors.black54,
                    fillColor: Colors.black54,
                    hoverColor: Colors.black54,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)
                      
                      )
                    ),
                    labelText: 'Nome Evento',
                    icon: Icon(Icons.fiber_new),                    

                ),
              ),
            ),

          Container(child: Text("Descrizione Evento"),),
          
          Padding(
              padding: EdgeInsets.all(16),
              
              child: TextField(
                
                maxLength: 600,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(80.0),
                  
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    labelText: 'Descrizione Evento',
                    icon: Icon(Icons.fiber_new),                    

                ),
              ),
            ),
         
         ]
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
                                
                              )

     );
    }
  }