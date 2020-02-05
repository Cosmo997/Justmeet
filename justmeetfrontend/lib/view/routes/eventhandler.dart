import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/theme.dart';

class EventHandlerPage extends StatefulWidget {
  final Evento currentEvent;
  EventHandlerPage({Key key, @required this.currentEvent}) : super(key: key);

  @override
  _EventHandlerPageState createState() => _EventHandlerPageState(currentEvent);
}

class _EventHandlerPageState extends State<EventHandlerPage> {
  final Evento currentEvent;

  _EventHandlerPageState(this.currentEvent);

  final DateFormat _df = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: true,
      onClosing: () {},
      builder: (context) => AnimatedContainer(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        duration: Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
              color: ThemeHandler.jmTheme().secondaryHeaderColor,
              borderRadius: BorderRadius.circular(30)),
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(child: Text("Titolo Evento"),),
              //Titolo
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      //color: ThemeHandler.jmTheme().primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    currentEvent.titolo,
                    style: TextStyle(fontSize: 20.0),
                  )),
              Divider(color: ThemeHandler.jmTheme().accentColor, indent: 20, endIndent: 20,thickness: 2,),
              //Descrizione
              Container(
                height: 300,
                child: Card(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Text(currentEvent.descrizione,
                        style: TextStyle(),)),
                    ),
                ),
              ),
              Wrap(
                
                spacing: 30.0,
                children: <Widget>[
                  //Partecipanti
                  Container(
                    child: RichText(
                      softWrap: false,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.people),
                            ),
                          TextSpan(
                            text: currentEvent.partecipanti.toString(),
                            ),
                        ]
                      ),
                    )
                  ),
                  //Topic 
                  Container(
                    child: RichText(
                      softWrap: false,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.category),
                            ),
                          TextSpan(
                            text: currentEvent.idTopic,
                            ),
                        ]
                      ),
                    )
                  ),
                  //Creatore
                  Container(
                    child: RichText(
                      softWrap: false,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.create),
                            ),
                          TextSpan(
                            text: currentEvent.idCreatore,
                            ),
                        ]
                      ),
                    )
                  ),
                  //Comune
                  Container(
                    child: RichText(
                      softWrap: false,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.place),
                            ),
                          TextSpan(
                            text: currentEvent.idComune,
                            ),
                        ]
                      ),
                    )
                  ),
                  
                  //DataInzio
                  Container(
                    child: RichText(
                      softWrap: false,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.calendar_today),
                            ),
                          TextSpan(
                            text: _df.format(currentEvent.inizioEvento),
                            ),
                        ]
                      ),
                    )
                  ),
                  //DataFine
                  Container(
                    child: RichText(
                      softWrap: false,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.calendar_today),
                            ),
                          TextSpan(
                            text: _df.format(currentEvent.fineEvento),
                            ),
                        ]
                      ),
                    )
                  ),
                ],
              ),

              //Iscriviti
              //Bottone Iscriviti se non iscritti || bottone disinscriviti se iscritti
              Row(
                children: <Widget>[
                  FutureBuilder(
                    future: ControllerJM().getNomeByIdUser(currentEvent.idCreatore),
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      if(snapshot.data == null)
                      return CircularProgressIndicator();
                      else return null;
                    },
                ),
                  RaisedButton(
                    onPressed: () => {},
                  )
                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}
