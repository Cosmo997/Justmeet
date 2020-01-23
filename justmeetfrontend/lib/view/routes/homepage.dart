import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/theme.dart';




class HomePage extends StatefulWidget{
  @override
    HomePageState createState() => HomePageState();
  }

class HomePageState extends State<HomePage>{
  final DateFormat _df = DateFormat("H:m dd/MM/yyyy");
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      future: ControllerJM.loadEvent(),
      builder: (BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
        if(snapshot.data == null)
        {
        return Container(
          child: Center(
                  child:CircularProgressIndicator()
                    )
        );
        }
        else
        {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Evento evento = snapshot.data[index];
              return  SingleChildScrollView(
                        child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: ThemeHandler.jmTheme().secondaryHeaderColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(evento.titolo),
                                  subtitle: Text(evento.descrizione),
                                  trailing: Icon(Icons.favorite_border), onTap: () => {}
                                  //Se loggato, salva l'evento tra i preferiti.
                                ),
                              Card(
                                elevation: 10,
                                
                                child: Container(
                                  margin: EdgeInsets.all(15),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Inizio Evento: " + _df.format(evento.inizioEvento)),
                                          Text("Posti disponibili: "+ evento.partecipanti.toString())
                                        ],
                                        ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Fine Evento: " + _df.format(evento.fineEvento)),
                                          Text("Topic: "+ evento.idTopic.toString()),
                                      ],)
                              //          ListTile(
                              //           title:Text(_df.format(evento.inizioEvento)),
                              //           subtitle: Text(_df.format(evento.fineEvento)),
                              //           trailing: Text("Numero partecipanti:"+evento.partecipanti.toString() +"\n\nTopic: "+ evento.idTopic.toString()),
                              // ),
                                  ],),
                                ),
                              ),
                              RaisedButton(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                
                                ),

                                child: Text("ISCRIVITI"),
                                color: ThemeHandler.jmTheme().accentColor,
                                onPressed: ()=>{}
                                //,
                              ),
                            ],
                            ),
                          ),
                        ),
                        );
                      },
            itemCount: snapshot.data.length,
            separatorBuilder: (context, index) => Divider(),
            );
        }

        },
    )
    );             
      }


@override
void initState() {super.initState();}
}