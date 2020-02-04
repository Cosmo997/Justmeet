import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';


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
        Container(
          color: Colors.transparent,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Titolo
            Text(currentEvent.titolo),
            //Descrizione
            Text(currentEvent.descrizione),
            //Partecipanti
            Text(currentEvent.partecipanti.toString()),
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
    );
  }
}