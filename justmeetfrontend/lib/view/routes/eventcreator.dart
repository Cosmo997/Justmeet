//import 'dart:html';
import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/controllerjm.dart';

import 'package:justmeet/classi/luogo.dart';
import 'package:justmeet/classi/topic.dart';
//import 'package:justmeet/classi/user.dart';

class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>{
      Evento currentEvent;
      bool isCreationDisabled;
      TextEditingController nameCtrl = TextEditingController();
      TextEditingController descCtrl = TextEditingController();
      TextEditingController maxPCtrl = TextEditingController();

      
@override
  void initState() {
    isCreationDisabled = false;
    //currentEvent = Evento();
    super.initState();
  }

@override
  void dispose() {
    nameCtrl.dispose();
    descCtrl.dispose();
    maxPCtrl.dispose();
    super.dispose();
  }  

   @override
    Widget build(BuildContext context)
    {
      
     return Scaffold (

      appBar:AppBar(
                   backgroundColor: Colors.black54,
                   elevation: 10,
                   title: Image.asset('assets/logo.png', scale: 2.5),
                   centerTitle: true,
                   ),

      body: Column(    
         children: <Widget>[

          Container(
            padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: TextField(
                  controller: nameCtrl,
                  onChanged: _onChanged(),
                  maxLength: 50,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8),)),
                      labelText: 'Nome Evento',
                      icon: Icon(Icons.fiber_new),                    

                  ),
                ),
              ),
          ),
  
          Container(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: descCtrl,
                  onChanged: _onChanged(),
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 10,
                  maxLength: 600,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      )
                      ,
                      labelText: 'Descrizione Evento',
                      icon: Icon(Icons.description),                    

                  ),
                ),
              ),
          ),          
     
          Container( 
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: maxPCtrl,
                  onChanged:_onChanged(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      
                      labelText: 'Numero Max Partecipanti',
                      icon: Icon(Icons.people),                    

                  ),
                ),
         
            
          ),

          RaisedButton(
                  padding: EdgeInsets.all(15),
                  child: Text("Crea Evento"),
                  onPressed: () async {if(isCreationDisabled){_creationPressed();}else{}},
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
                                                  
                                                ) );}



  // METODI ESTERNI  
         
      _creationPressed() {
        Topic top;
        top = new Topic("id", "argomento");
        Luogo luogo = new Luogo();
        currentEvent = new Evento("id1", nameCtrl.text, descCtrl.text, int.parse(maxPCtrl.text), top ,luogo, "idCreatore");
        currentEvent.setNome(nameCtrl.text);
        currentEvent.setDesc(descCtrl.text);
        currentEvent.setMaxPartecipanti(int.parse(maxPCtrl.text));
        setState(() {
          ControllerJM.sendEvent(currentEvent);});}

      _onChanged() {
        print(isCreationDisabled);
          setState(() {
            isCreationDisabled = (descCtrl.text.isNotEmpty || nameCtrl.text.isNotEmpty || maxPCtrl.text.isNotEmpty);
          });

      }
  
  
  
  }