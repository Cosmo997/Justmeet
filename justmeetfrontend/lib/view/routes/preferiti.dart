


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/classi/evento.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/theme.dart';

  //TODO vuole USER in ingresso

class Preferiti extends StatefulWidget {

  @override
  PreferitiState createState() => PreferitiState();
}

class PreferitiState extends State<Preferiti>
{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      //TODO non corretto sistemare
      future: ControllerJM.loadPreferitiByUtente(AuthProvider.getUId()),
      builder: (BuildContext context, AsyncSnapshot<List<Evento>> snapshot) {
        if(snapshot.data == null)
       {
        return Container(
          child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("LOADING", style: TextStyle(color: ThemeHandler.jmTheme().accentColor),),
                      Divider(color: ThemeHandler.jmTheme().accentColor, height: 30,indent: 50 ,endIndent: 50,),
                      CircularProgressIndicator(),
                    ],
                  ),
                    )
        );
        }
        else
        if(snapshot.data.length == 0)
        {
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Non hai preferiti")
                ],
              ),
            ),
          );
        }
        else
        {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Evento evento = snapshot.data[index];
              return  SingleChildScrollView(
                        child: Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(evento.titolo),
                                  subtitle: Text(evento.descrizione, maxLines: 10,),
                                )
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