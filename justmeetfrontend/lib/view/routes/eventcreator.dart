import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/comune.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/classi/provincia.dart';
import 'package:justmeet/classi/regione.dart';
import 'package:justmeet/controllerjm.dart';

/// Responsabilità: Creare un Evento.
class EventCreator extends StatefulWidget 
  {
  @override
  State<StatefulWidget> createState() => EventCreatorState();
  }
  
  class EventCreatorState extends State<EventCreator>{

      final DateFormat df = DateFormat("dd/MM/yyyy");
      // Evento da creare
      Evento currentEvent;
      // Elementi Evento
      DateTime _selectedDateStart = DateTime.now();	
      TimeOfDay _selectedTimeStart = TimeOfDay.now();
      DateTime _selectedDateFinish = DateTime.now();
      TimeOfDay _selectedTimeFinish = TimeOfDay.now();
     
      int currentIndex = 3;
      bool isCreationDisabled;
      TextEditingController nameCtrl = TextEditingController();
      TextEditingController descCtrl = TextEditingController();
      TextEditingController maxPCtrl = TextEditingController();
      
      bool isRegioneScelta = false;
      bool isProvinciaScelta = false;

      Regione currentRegione;
      Provincia currentProvincia;
      Comune currentComune;
      
      String dropItemRegione;
      String dropItemProvincia;
      String dropItemComune;

       //List<Topic> listTopic;
        //Topic selectedTopic;
        //List<String> argomentiTopic;


   @override
    Widget build(BuildContext context)
    {     
       return Scaffold (
         backgroundColor: Colors.grey,
        body: SingleChildScrollView(
        
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
          color: Colors.white,
          borderOnForeground: true,
          child: Column( 
            children: <Widget>[

            // Container Nome Evento
            Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextField(
                    controller: nameCtrl,
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
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 10,
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
            
            // Colonna N max , Regione, Provincia, Comune
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Max persone
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: 105,
                  child: TextField(
                    controller: maxPCtrl,
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
                      value: dropItemRegione,
                      items: snapshot.data.map( (Regione data) { 
                                          return DropdownMenuItem<String>(
                                            value: data.nome,
                                            child: Text(data.nome),);}).toList(), 
                      onChanged: (String value) => setState(() {dropItemRegione = value; isRegioneScelta = true;}),
                       );
                    }
                   },)
                   ),

                //Provincia
                if (isRegioneScelta)
                Container(
                  child: FutureBuilder(
                  future: ControllerJM.loadProvinciaByRegione(dropItemRegione),
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
                      onChanged: (String value) => setState(() {dropItemProvincia = value;isProvinciaScelta = true;}),
                      hint: Text("Seleziona provincia"),
                      value: dropItemProvincia,
                      );
                    }
                   },)
                   ),
                

                // Comune
                if(isProvinciaScelta)
                Container(
                  child: FutureBuilder(
                  future: ControllerJM.loadComuneByProvincia(dropItemProvincia),
                  builder: (BuildContext context, AsyncSnapshot<List<Comune>> snapshot) {
                    if(snapshot.data == null)
                    {
                      return CircularProgressIndicator();
                    }
                    else{
                     return DropdownButton(
                      hint: Text("Seleziona Comune"),
                      value: dropItemComune,
                      items:snapshot.data.map( (Comune data) { 
                                          return DropdownMenuItem<String>(
                                            value: data.nome,
                                            child: Text(data.nome),);}).toList(), 
                      onChanged: (value) => setState(() { dropItemComune = value;}),
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

            // Riga Data e Ora Fine
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text("Fine Evento:")
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
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: RaisedButton(
                      padding: EdgeInsets.all(15),
                      child: Text("Crea Evento"),
                      onPressed: () => _creaEvento(),
                      ),
            ),
                    ]     
                    ),
        ),
                  ),
                  );
                  
                  
                  
    }
       






      // METODI ESTERNI  
                  
     void _creaEvento(){
      bool none = false;
      currentEvent = new Evento("0", nameCtrl.text, descCtrl.text, int.parse(maxPCtrl.text),"1", dropItemComune,"id provvisorio", _selectedDateStart.toIso8601String(), _selectedDateFinish.toIso8601String(),none);
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
                      nameCtrl.dispose();
                      descCtrl.dispose();
                      maxPCtrl.dispose();
                      super.dispose();
                    } 
                  
}
