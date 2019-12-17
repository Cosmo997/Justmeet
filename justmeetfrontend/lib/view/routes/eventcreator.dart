//import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>{

      int currentIndex = 3;
      bool isCreationDisabled;
      TextEditingController nameCtrl = TextEditingController();
      TextEditingController descCtrl = TextEditingController();
      TextEditingController maxPCtrl = TextEditingController();

   @override
    Widget build(BuildContext context)
    {
     return Scaffold (
      body: SingleChildScrollView(
        child: Column(    
          
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
                      ),
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
                  onPressed: _makePostRequest,
                            ),   
                            SizedBox(height: 20,),     
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

  // user defined function
  void _showDialog(String nome, String des, int part) {
    // flutter defined function
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
    );
  }
      _onChanged() {
        print(isCreationDisabled);
          setState(() {
            isCreationDisabled = (descCtrl.text.isNotEmpty || nameCtrl.text.isNotEmpty || maxPCtrl.text.isNotEmpty);
          });

      }
  
  
  
}