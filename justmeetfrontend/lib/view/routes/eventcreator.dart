import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/comune.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/classi/provincia.dart';
import 'package:justmeet/classi/regione.dart';
import 'package:justmeet/classi/topic.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/theme.dart';

/// Responsabilità: Creare un Evento.
class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>{

      final DateFormat _df = DateFormat("dd/MM/yyyy");
      bool _isRegioneScelta = false;
      bool _isProvinciaScelta = false;
      // Evento da creare
      Evento _currentEvent;
      // Elementi Evento
      DateTime _selectedDateStart = DateTime.now();	
      TimeOfDay _selectedTimeStart = TimeOfDay.now();
      DateTime _selectedDateFinish = DateTime.now();
      TimeOfDay _selectedTimeFinish = TimeOfDay.now();
      TextEditingController _titolo = TextEditingController();
      TextEditingController _descrizione = TextEditingController();
      TextEditingController _partecipanti = TextEditingController();
      String _currentRegione;
      String _currentProvincia;
      String _currentComune;
      String _currentTopic;
      


   @override
    Widget build(BuildContext context)
    {     
       return Scaffold (
        body: SingleChildScrollView(
        
        child: Column(
          children: <Widget>[
            Container(
                 alignment: Alignment.center,
                 child: Text("Creazione Nuovo Evento"),
                 padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
               ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.all(5),
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: ThemeHandler.jmTheme().secondaryHeaderColor,
                
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Column( 
                  children: <Widget>[
                    
                  // Container Nome Evento
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          controller: _titolo,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8),)),
                              labelText: 'Nome Evento',
                              icon: Icon(Icons.fiber_new,color: ThemeHandler.jmTheme().accentColor),                    
                          ),
                        ),
                      ),
                  ),
                  
                  // Container Descrizione Evento
                  Container(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _descrizione,
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 10,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              labelText: 'Descrizione Evento',
                              icon: Icon(Icons.description, color: ThemeHandler.jmTheme().accentColor),                    
                          ),
                        ),
                      ),
                  ),          
                  
                  // Colonna N max, Topics, Regione, Provincia, Comune
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //Max persone, Topics
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            width: 105,
                            child: TextField(
                              controller: _partecipanti,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  
                                  labelText: 'Max',
                                  icon: Icon(Icons.people,color: ThemeHandler.jmTheme().accentColor)                   

                              ),
                            ),
                          ),
                          Container(
                            //padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: FutureBuilder(
                              future: ControllerJM.loadTopics(),
                              builder: (BuildContext context, AsyncSnapshot<List<Topic>> snapshot){
                                if(snapshot.data == null)
                                {
                                  return CircularProgressIndicator();
                                }
                                else{
                                  return DropdownButton(      
                            hint: Text("Seleziona Topic"),
                            value: _currentTopic,
                            items: snapshot.data.map( (Topic data) { 
                                                return DropdownMenuItem<String>(
                                                  value: data.argomento,
                                                  child: Text(data.argomento),);}).toList(), 
                            onChanged: (String value) => setState(() {_currentTopic = value;}),
                             );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      
                      //Regione
                      Container(
                        child: FutureBuilder(
                        future: ControllerJM.loadRegioni(),
                        builder: (BuildContext context, AsyncSnapshot<List<Regione>> snapshot) {
                          if(snapshot.data == null)
                          {
                            return CircularProgressIndicator();
                          }
                          else{
                           return DropdownButton(
                            hint: Text("Seleziona regione"),
                            value: _currentRegione,
                            items: snapshot.data.map( (Regione data) { 
                                                return DropdownMenuItem<String>(
                                                  value: data.nome,
                                                  child: Text(data.nome),);}).toList(), 
                            onChanged: (String value) => setState(() {
                              print(value);
                              _currentRegione = value; _isRegioneScelta = true;}),
                             );
                          }
                         },)
                         ),

                      //Provincia
                      if (_isRegioneScelta)
                      Container(
                        child: FutureBuilder(
                        future: ControllerJM.loadProvinciaByRegione(_currentRegione),
                        builder: (BuildContext context, AsyncSnapshot<List<Provincia>> snapshot) {
                          if(snapshot.data == null)
                          {
                            return CircularProgressIndicator();
                          }
                          else{
                           return DropdownButton(
                            items:snapshot.data.map( (Provincia data) { 
                                                return DropdownMenuItem<String>(
                                                  value: data.nome,
                                                  child: Text(data.nome),);}).toList(), 
                            onChanged: (String value) => setState(() {
                              print(_currentProvincia);
                              _currentProvincia = value;_isProvinciaScelta = true;}),
                            hint: Text("Seleziona provincia"),
                            value: _currentProvincia,
                            );
                          }
                         },)
                         ),
                      

                      // Comune
                      if(_isProvinciaScelta)
                      Container(
                        child: FutureBuilder(
                        future: ControllerJM.loadComuneBySiglaProvincia(_currentProvincia),
                        builder: (BuildContext context, AsyncSnapshot<List<Comune>> snapshot) {
                          if(snapshot.data == null)
                          {
                            return CircularProgressIndicator();
                          }
                          else{
                           return DropdownButton(
                            hint: Text("Seleziona Comune"),
                            value: _currentComune,
                            items:snapshot.data.map( (Comune data) { 
                                                return DropdownMenuItem<String>(
                                                  value: data.nome,
                                                  child: Text(data.nome),);}).toList(), 
                            onChanged: (value) => setState(() { _currentComune = value;}),
                             );
                          }
                         },)
                         )


                      
                    ],
                    ),

                  // Riga Data e Ora Inizio
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text("Inizio Evento:")
                        ),
                      
                      Text(_df.format(_selectedDateStart)),
                      IconButton(
                               color: ThemeHandler.jmTheme().accentColor,
                               icon: Icon(Icons.date_range),
                               onPressed: () => getDataStart(context),
                             ),
                      Text(_selectedTimeStart.format(context)),
                      IconButton(
                               color: ThemeHandler.jmTheme().accentColor,
                               icon: Icon(Icons.date_range),
                               onPressed: () => getTimeStart(context),
                             ),
                             ],
                  ),  

                  // Riga Data e Ora Fine
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text("Fine Evento:")
                        ),
                        Text(_df.format(_selectedDateFinish)),
                      IconButton(
                               color: ThemeHandler.jmTheme().accentColor,
                               icon: Icon(Icons.date_range),
                               onPressed: () => getDataFinish(context),
                             ),
                      Text(_selectedTimeFinish.format(context)),
                      IconButton(
                               color: ThemeHandler.jmTheme().accentColor,
                               icon: Icon(Icons.date_range),
                               onPressed: () => getTimeFinish(context),
                             ),
                    ],
                  ),

                  //Bottone Crea Evento
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            padding: EdgeInsets.all(15),
                            child: Text("Crea Evento"),
                            textTheme: ButtonTextTheme.primary,
                            onPressed: () => _creaEvento(),
                            ),
                  ),
                    ]     
                  ),
              ),
            ),
          ],
        ),
                  ),
                  );             
    }

      // METODI ESTERNI  
                  
     void _creaEvento(){
      _currentEvent = new Evento(_titolo.text, _descrizione.text, int.parse(_partecipanti.text),_currentTopic,"Giovanni",_currentComune, _selectedDateStart.toIso8601String(),_selectedDateFinish.toIso8601String());
      print("Evento creato");
      print(_currentEvent.toString());
      Future<bool> esito = ControllerJM.makePostRequest(_currentEvent);
      esito.then((bool value) => _showDialog(_currentEvent,value));
     
     } 
                  
     void _showDialog(Evento event,bool esito) {
          showDialog(
          context: context,
          builder: (BuildContext context) {
            if(esito)
            return AlertDialog(
                title: new Text("Evento: \n"+ event.titolo+ "\nCreato correttamente"),
                content: new Text("Descrizione:"+event.descrizione+" \n Numero di partecipanti: "+ event.partecipanti.toString()),
                actions: <Widget>[
                  new FlatButton(
                      child: new Text("Torna alla home"),
                      onPressed: () {setState(() {
                        _fineCreazione();
                                                
                                              });},
                                                      ),
                                                    ],
                                    );
                                    else
                                    return AlertDialog(
                                        title: new Text("Evento: \n"+ event.titolo+ "\nNon Creato"),
                                        content: new Text("Descrizione:"+event.descrizione+" \n Numero di partecipanti: "+ event.partecipanti.toString()),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: Text("Back"),
                                            onPressed: ()=>{},
                                          )
                                        ],);
                                                },
                                              );
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
     super.initState();
      }
                                          
     @override
     void dispose() {
     _titolo.dispose();
     _descrizione.dispose();
     _partecipanti.dispose();
      super.dispose();
    }
                        
  void _fineCreazione() {
    _currentEvent = null;
     _selectedDateStart = DateTime.now();	
     _selectedTimeStart = TimeOfDay.now();
     _selectedDateFinish = DateTime.now();
    _selectedTimeFinish = TimeOfDay.now();
    _titolo.clear();
    _descrizione.clear();
    _partecipanti.clear();
    _isRegioneScelta = false;
    _isProvinciaScelta = false;
    _currentRegione = "";
    _currentProvincia = "";
    _currentComune  = "";
 } 
                  
}
