import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
//import 'package:justmeet/classi/luogo.dart';
//import 'package:justmeet/classi/topic.dart';

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;



/// Responsabilità: Creare un Evento.
class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>{

      final DateFormat df = DateFormat("dd/MM/yyyy");
      DateTime _selectedDate = DateTime.now();	
      TimeOfDay _selectedTime = TimeOfDay.now();
      Evento currentEvent;
      int currentIndex = 3;
      bool isCreationDisabled;
      TextEditingController nameCtrl = TextEditingController();
      TextEditingController descCtrl = TextEditingController();
      TextEditingController maxPCtrl = TextEditingController();
      //ArrayList<Luogo> luoghi = 


   @override
    Widget build(BuildContext context)
    {
     return Scaffold (
      body: SingleChildScrollView(
        child: Column(    
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
                      ),
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
                  onPressed: _makePostRequest,),
          
          RaisedButton(
                  padding: EdgeInsets.all(15),
                  child: Text("Prova"),
                  onPressed: _prova,)
                                              ]     
                                        ),
                                          
                                          ),
                            );
                  }
                  
                  
                    // METODI ESTERNI  
                  
                         void _makePostRequest() async {
                    // set up POST request arguments
                    String url = 'https://springboot-restapi.herokuapp.com/eventi';
                    Map<String, String> headers = {"Content-type": "application/json"};
                  
                    String titolo = nameCtrl.text;
                    String desc = descCtrl.text;
                    int numPar = int.parse(maxPCtrl.text);
                    
                  
                    String json = '{"id": "4", "titolo": "$titolo", "desc": "$desc", "partecipanti": $numPar ,"idTopic": "idTopicApp","idCreator": "idCreatoreApp","idLuogo": "idLuogoApp","user": "idCreatoreApp"}';
                    // make POST request
                    http.Response response = await http.post(url, headers: headers, body: json);
                    // check the status code for the result
                    int statusCode = response.statusCode;
                  
                    print("Status code:" +statusCode.toString());
                    if(statusCode == 200)
                    _showDialog(titolo, desc, numPar);
                  
                    }
                  
                        void _showDialog(String nome, String des, int part) {
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Evento: $nome creato correttamente"),
                            content: new Text("Descrizione: $des \n Numero di partecipanti: $part"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Torna alla home"),
                                onPressed: () {},
                              ),
                            ],
                          );
                        },
                      );}
                   
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
                  
                    
                    void _prova() {
                      var prova1 = jsonEncode(_selectedDate.toIso8601String());
                      var prova2 = jsonEncode(_selectedTime.toString());
                      print(prova1);
                      print(prova2);
  }
}
