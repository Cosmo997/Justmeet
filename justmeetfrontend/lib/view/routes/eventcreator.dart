import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/controllerjm.dart';
import 'package:justmeet/classi/luogo.dart';
import 'package:justmeet/classi/topic.dart';


/**
 * Responsabilità: Creare un Evento.
 */
class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>{

      DateTime _selectedDate = DateTime.now();	
      TimeOfDay _selectedTime = TimeOfDay.now();
      Evento currentEvent;
      bool isCreationDisabled;
      TextEditingController nameCtrl = TextEditingController();
      TextEditingController descCtrl = TextEditingController();
      TextEditingController maxPCtrl = TextEditingController();
      ArrayList<Luogo> luoghi = 
      

 

   @override
    Widget build(BuildContext context)
    {
      final DateFormat df = DateFormat("dd/MM/yyyy");
     return Scaffold (

      appBar:AppBar(
                   backgroundColor: Colors.black54,
                   elevation: 10,
                   title: Image.asset('assets/logo.png', scale: 2.5),
                   centerTitle: true,
                   ),

      body: Column(    
         children: <Widget>[
          
           //Container Nome Evento
          Container(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: nameCtrl,
                  onChanged: _onChanged(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8),)),
                      labelText: 'Nome Evento',
                      icon: Icon(Icons.fiber_new),                    

                  ),
                ),
              ),
          ),
          
          // Container Descrizione Evento
          Container(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: descCtrl,
                  onChanged: _onChanged(),
                  textCapitalization: TextCapitalization.sentences,
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
          
          // Riga N max , Regione, Provincia, Città
         Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: 105,
                child: TextField(
                  controller: maxPCtrl,
                  onChanged:_onChanged(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      
                      labelText: 'Max',
                      icon: Icon(Icons.people)                   

                  ),
                ),
              ),

              //Regione Provincia Città
            ],
            ),

          //Riga Data e Ora Inizio
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text("Data e Ora inizio:")
                ),
              
              Text(df.format(_selectedDate)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getData(context),
                     ),
              Text(_selectedTime.format(context)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getTime(context),
                     ),

              
            ],
          ),  

          //Riga Data e Ora Fine
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text("Data e ora fine: ")
                ),
                Text(df.format(_selectedDate)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getData(context),
                     ),
              Text(_selectedTime.format(context)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getTime(context),
                     ),
              
              

              
            ],
          ),



         
          //Bottone Crea Evento
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
  
      void getData(context) async {
          var fDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2018),
          lastDate: DateTime(2030),
   );
     //aggiornare lo stato
     if (fDate != null) setState(() => _selectedDate = fDate);

  }
  
      void getTime(context) async {
    var fTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime
    );
    if (fTime != null) setState(() => _selectedTime = fTime);
  }

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

  }