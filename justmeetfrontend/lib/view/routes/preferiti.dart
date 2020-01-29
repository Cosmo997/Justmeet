
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';

  //TODO vuole USER in ingresso

class Preferiti extends StatefulWidget {
  @override
  PreferitiState createState() => PreferitiState();
}

class PreferitiState extends State<Preferiti>
{
  String idUtentefasullo = "1234";
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      //TODO non corretto sistemare
      future: ControllerJM.loadEvents(),
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
                          color: Colors.white,
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
                                elevation: 5,
                                color: Colors.white,
                                margin: EdgeInsets.all(40),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                       ListTile(
                                title: Text(evento.inizioEvento.toString()),
                                subtitle: Text(evento.fineEvento.toString()),
                                trailing: Text("Numero partecipanti:"+evento.partecipanti.toString() +"\n\nTopic: "+ evento.idTopic.toString()),
                              ),
                                  ],),
                                ),
                              ),
                              RaisedButton(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.grey)
                                ),

                                child: Text("ISCRIVITI"),
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
 
}