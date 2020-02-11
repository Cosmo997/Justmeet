import 'package:flutter/material.dart';
import 'package:justmeet/model/comune.dart';
import 'package:justmeet/model/provincia.dart';
import 'package:justmeet/model/regione.dart';
import 'package:justmeet/model/topic.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/theme.dart';


class RicercaPage extends StatefulWidget {
  RicercaPage({Key key}) : super(key: key);

  @override
  _RicercaPageState createState() => _RicercaPageState();
}

class _RicercaPageState extends State<RicercaPage> {
  List<String> argomenti = new List<String>();
  TextEditingController ricerca;
  bool _isRegioneScelta = false;
  bool _isProvinciaScelta = false;
  String _currentRegione;
  String _currentSiglaProvincia;
  String _currentComune;
  String _currentTopic;

  
  @override
  void initState() {
    this.ricerca = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Titolo
            Container(
                 alignment: Alignment.center,
                 child: 
                 Text("Seleziona un' Area Geografica", style: TextStyle(color: ThemeHandler.jmTheme().accentColor, fontSize: 15),
                 ),
                 padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
               ),
            Divider(color: ThemeHandler.jmTheme().accentColor, indent: 40, endIndent: 40, height: 10,),
            //Contenuto scelta area
            Container(
              height: 250,
              width: 300,
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.all(5),
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: ThemeHandler.jmTheme().secondaryHeaderColor,
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                        future: ControllerJM.loadComuneBySiglaProvincia(_currentSiglaProvincia),
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
              ),
              
            ),
            //Titolo
            Container(
                 alignment: Alignment.center,
                 child: 
                 Text("Seleziona un Topic", style: TextStyle(color: ThemeHandler.jmTheme().accentColor, fontSize: 15),
                 ),
                 padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
               ),
            Divider(color: ThemeHandler.jmTheme().accentColor, indent: 40, endIndent: 40, height: 10,),
            //Contenuto scelta topic
            Container(
              height: 100,
              width: 300,
              padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
              margin: EdgeInsets.all(5),
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                color: ThemeHandler.jmTheme().secondaryHeaderColor,
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                      Container(
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
                                      ),
                                    ],
                                  ),
                ),
              ),
            //Titolo teto
            Container(
                 alignment: Alignment.center,
                 child: 
                 Text("Cerca nel titolo", style: TextStyle(color: ThemeHandler.jmTheme().accentColor, fontSize: 15),
                 ),
                 padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
               ),
            Divider(color: ThemeHandler.jmTheme().accentColor, indent: 40, endIndent: 40, height: 10,),
            //Contenuto parole chiave
            Container(
              child: TextField(
                controller: ricerca,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8),)),
                    labelText: 'Cerca...',
                ),
                        ),
            ),
        RaisedButton.icon(
          onPressed: () {
            Navigator.of(context).pushNamed('/ricerca', arguments: ControllerJM.search(ricerca.text, _currentTopic, _currentComune));
          },
          icon: Icon(Icons.ac_unit), 
          label: Text("Cerca"),)
          ],
        ),
      )
      
        
          // Container( VistaEventi(events: ControllerJM.search(ricerca.text, _currentTopic, _currentComune));
          //   padding: EdgeInsets.all(5),
          //   child: SearchBar<Evento>(
          //     onSearch: ControllerJM.search(ricerca.text, topic, comune) 
          //     onItemFound: (Evento e, int index) {
          //       return ListTile(
          //         title: Text(post.title),
          //         subtitle: Text(post.description),
          //       ),
          //     emptyWidget: null,
          //     loader: CircularProgressIndicator(),
          //     ),



          // ),
          
          //Builder(builder: null)
    );
  }
}