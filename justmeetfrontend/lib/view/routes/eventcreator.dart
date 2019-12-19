import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
//import 'package:http/http.dart' as http;
import 'package:justmeet/classi/topic.dart';
import 'package:justmeet/controllerjm.dart';

/// Responsabilità: Creare un Evento.
class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>{

      final DateFormat df = DateFormat("dd/MM/yyyy");
      DateTime _selectedDateStart = DateTime.now();	
      TimeOfDay _selectedTimeStart = TimeOfDay.now();
      DateTime _selectedDateFinish = DateTime.now();
      TimeOfDay _selectedTimeFinish = TimeOfDay.now();
      Evento currentEvent;
      int currentIndex = 3;
      bool isCreationDisabled;
      TextEditingController nameCtrl = TextEditingController();
      TextEditingController descCtrl = TextEditingController();
      TextEditingController maxPCtrl = TextEditingController();

        //List<Topic> listTopic;
        //List<DropdownMenuItem<Topic>> dropdownItem;
        //Topic selectedTopic;
        //List<String> argomentiTopic;


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
              
              Text(df.format(_selectedDateStart)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getDataStart(context),
                     ),
              Text(_selectedTimeStart.format(context)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getTimeStart(context),
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
                Text(df.format(_selectedDateFinish)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getDataFinish(context),
                     ),
              Text(_selectedTimeFinish.format(context)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getTimeFinish(context),
                     ),
            ],
          ),
          //Bottone Crea Evento
          RaisedButton(
                  padding: EdgeInsets.all(15),
                  child: Text("Crea Evento"),
                  onPressed: () => _creaEvento(),
                  ),
          
          RaisedButton(
                  padding: EdgeInsets.all(15),
                  child: Text("Prova"),
                  onPressed: _prova,
                  ),
          
  /*       DropdownButton(
            value: selectedTopic,
            items: argomentiTopic.map((value) => DropdownMenuItem(
              child: Text(value),
              value: value,)).toList(),
              onChanged: (selectedTopicT) {
                setState(() {
                   selectedTopic = selectedTopicT;
                });
              },
            ),
    */
                                              ]     
                                        ),
                                    ),
                            );
                  }

                  
      // METODI ESTERNI  
                  
     void _creaEvento()
     {
      bool none = false;
      currentEvent = new Evento("0", nameCtrl.text, descCtrl.text, int.parse(maxPCtrl.text),"1", "nome provvisorio","id provvisorio", _selectedDateStart.toIso8601String(), _selectedDateFinish.toIso8601String(),none);
      print("Evento creato");
      print(currentEvent.toString());
      Future<bool> esito = ControllerJM.makePostRequest(currentEvent);
      esito.then((bool value) => _showDialog(currentEvent,value));
     
     } 
                  
     void _showDialog(Evento event,bool esito) {
          showDialog(
          context: context,
          builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Evento: "+ event.titolo+ "creato correttamente"),
                content: new Text("Descrizione:"+event.desc+" \n Numero di partecipanti: "+ event.partecipanti.toString()),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                      child: new Text("Torna alla home"),
                      onPressed: () {},
                              ),
                            ],
                          );
                        },
                      );
          }
                   
      _onChanged() {
                            setState(() {
                              isCreationDisabled = (descCtrl.text.isNotEmpty || nameCtrl.text.isNotEmpty || maxPCtrl.text.isNotEmpty);
                            });
                  
                        }
                    
      void getDataStart(context) async {
                            var fDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDateStart,
                            firstDate: DateTime(2018),
                            lastDate: DateTime(2030),
                     );
                       //aggiornare lo stato
                       if (fDate != null) setState(() => _selectedDateStart = fDate);
                  
                    }
      void getDataFinish(context) async {
                            var fDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDateFinish,
                            firstDate: DateTime(2018),
                            lastDate: DateTime(2030),
                     );
                       //aggiornare lo stato
                       if (fDate != null) setState(() => _selectedDateFinish = fDate);
                  
                    }
                    
      void getTimeStart(context) async {
                      var fTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedTimeStart
                      );
                      if (fTime != null) setState(() => _selectedTimeStart = fTime);
                    }
       void getTimeFinish(context) async {
                      var fTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedTimeFinish
                      );
                      if (fTime != null) setState(() => _selectedTimeFinish = fTime);
                    }
                  
      @override
      void initState() {
                      isCreationDisabled = false;
                      //currentEvent = Evento();
                      //getTopic();
                      //dropdownItem = creaListaTopic(listTopic);
                      //riempiLista(listTopic);
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
                      var prova1 = jsonEncode(_selectedDateStart.toIso8601String());
                      var prova2 = jsonEncode(_selectedTimeStart.toString());
                      print(prova1);
                      print(prova2);
  }

      List<DropdownMenuItem<Topic>> creaListaTopic (List<Topic> topics){
          List<DropdownMenuItem<Topic>> items = List();
          for (Topic topic in topics) 
          {
            items.add(DropdownMenuItem(
              value: topic,
              child: Text(topic.argomento),
              )
              );  
          }
          print(items);
          return items;
        }
/*
      Future getTopic() async{
        http.Response response = await http.get('https://springboot-restapi.herokuapp.com/topics');
        List collection = json.decode(response.body);
        //print(collection);
        List<Topic> _listTopic = collection.map((json) => Topic.fromJson(json)).toList();

        setState(() {
          listTopic = _listTopic;
          super.initState();
        });

      }
*/
/*
      void riempiLista(List<Topic> lista){
        for (Topic topic in lista) {
          argomentiTopic.add(topic.argomento);
  }
  print(argomentiTopic);
}
*/
}
