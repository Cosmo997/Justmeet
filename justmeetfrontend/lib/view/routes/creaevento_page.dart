import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/model/comune.dart';
import 'package:justmeet/model/evento.dart';
import 'package:justmeet/model/provincia.dart';
import 'package:justmeet/model/regione.dart';
import 'package:justmeet/model/topic.dart';
import 'package:justmeet/utils/controllerAPI/evento_token_controller.dart';
import 'package:justmeet/utils/controllerAPI/luogo_controller.dart';
import 'package:justmeet/utils/controllerAPI/topic_controller.dart';
import 'package:justmeet/utils/auth_provider.dart';
import 'package:justmeet/utils/theme.dart';
/// Responsabilità: Creare un Evento.
class CreaEventoPage extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => CreaEventoPageState();
  }
  
  class CreaEventoPageState extends State<CreaEventoPage>{

      EventoTokenController eventoTokenController = new EventoTokenController();
      LuogoController luogoController = new LuogoController();
      TopicController topicController = new TopicController();
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
      String _currentSiglaProvincia;
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
                 child: 
                 Text("Creazione Nuovo Evento", style: TextStyle(color: ThemeHandler.jmTheme().accentColor, fontSize: 15),
                 ),
                 padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
               ),
               Divider(color: ThemeHandler.jmTheme().accentColor, indent: 40, endIndent: 40, height: 10,),
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
                            child: FutureBuilder(
                              future: topicController.loadTopics(),
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
                        future: luogoController.loadRegioni(),
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
                              _currentRegione = value; _isRegioneScelta = true;}),
                             );
                          }
                         },)
                         ),

                      //Provincia
                      if (_isRegioneScelta)
                      Container(
                        child: FutureBuilder(
                        future: luogoController.loadProvinciaByRegione(_currentRegione),
                        builder: (BuildContext context, AsyncSnapshot<List<Provincia>> snapshot) {
                          if(snapshot.data == null)
                          {
                            return CircularProgressIndicator();
                          }
                          else{
                           return DropdownButton(
                            items:snapshot.data.map( (Provincia data) { 
                                                return DropdownMenuItem<String>(
                                                  value: data.sigla,
                                                  child: Text(data.nome),);}).toList(), 
                            onChanged: (String value) => setState(() {
                              _currentSiglaProvincia = value;
                              _isProvinciaScelta = true;}),
                            hint: Text("Seleziona provincia"),
                            value: _currentSiglaProvincia,
                            );
                          }
                         },)
                         ),
                      

                      // Comune
                      if(_isProvinciaScelta)
                      Container(
                        child: FutureBuilder(
                        future: luogoController.loadComuneBySiglaProvincia(_currentSiglaProvincia),
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
                            shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            ),
                            child: Text("Crea Evento", style: TextStyle(color: Colors.white),),
                            textTheme: ButtonTextTheme.primary,
                            onPressed: () {
                              if(_titolo.text.isEmpty || _descrizione.text.isEmpty || _partecipanti.text.isEmpty || _currentComune == null)
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Attenzione"),
                                    content: Text("Compilare tutti i campi prima di creare un nuovo evento"),
                                   );
                            }
                            );
                            }
                            else {
                              _creaEvento();
                            }
                               },
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
                  
     Future<void> _creaEvento() async {
      _currentEvent = new Evento(_titolo.text, _descrizione.text, int.parse(_partecipanti.text),_currentTopic,await AuthProvider.getUId(),_currentComune, _selectedDateStart.toIso8601String(),_selectedDateFinish.toIso8601String());
      Future<bool> esito = eventoTokenController.postEvent(_currentEvent, AuthProvider.getToken());
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
                      onPressed: () {
                        Navigator.of(context).pop();
                        _isProvinciaScelta = false;
                        _isRegioneScelta = false;
                        setState(() {
                        _fineCreazione();
                                                
                                    });
                                    },
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
                      onPressed: ()=> Navigator.of(context).pop(),
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
    _currentRegione = null;
    _currentComune = null;
    _currentSiglaProvincia = null;
    _currentTopic = null;
    _titolo = TextEditingController(text: "");
    _descrizione = TextEditingController(text: "");
    _partecipanti = TextEditingController(text: "");
 } 
                  
}
