import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/utils/theme.dart';


class EventHandlerPage extends StatefulWidget {
  final Evento currentEvent;
  EventHandlerPage({Key key,@required this.currentEvent}) : super(key: key);

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
      builder: (context) => 
        AnimatedContainer(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)),
          duration: Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
                color: ThemeHandler.jmTheme().secondaryHeaderColor,
                borderRadius: BorderRadius.circular(30)),
            height: 400,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Titolo
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                color: ThemeHandler.jmTheme().primaryColor,
                borderRadius: BorderRadius.circular(30)),
                child: Text(
                  currentEvent.titolo,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: ThemeHandler.jmTheme().accentColor
                  ),)),
              //Descrizione
              Container(
                height: 100,
                child: SingleChildScrollView(
                  child: Text(currentEvent.descrizione)),
              ),
              //Partecipanti
              Text((currentEvent.partecipanti - currentEvent.iscrizioni.length).toString()),
              //Topic
              Text(currentEvent.idTopic),
              //Creatore
              Text(currentEvent.idCreatore),
              //Comune
              Text(currentEvent.idComune),
              //DataInzio
              Text(_df.format(currentEvent.inizioEvento)),
              //DataFine
              Text(_df.format(currentEvent.fineEvento)),
              //Iscriviti
              //Bottone Iscriviti se non iscritti || bottone disinscriviti se iscritti
            ],
      ),
          ),
        ),
    );
  }
}