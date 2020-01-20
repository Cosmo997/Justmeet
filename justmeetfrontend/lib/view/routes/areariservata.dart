import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AreaRiservata extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return AreaRiservataState();
      }
    }
  

  class AreaRiservataState extends State<AreaRiservata>{
    bool isDarkModeEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Account
            Card(
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Account",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        ),),
                    alignment: Alignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        child: Padding(
                         padding: EdgeInsets.all(8),
                         child: CircleAvatar(
                           radius: 56,
                           backgroundImage: AssetImage("\logo.png"),
                         )
                       ),
                          alignment: Alignment.topLeft,
                        ),
                      Column(
                        children: <Widget>[
                          Text("Username: "),
                          Text("Email: "),
                          Text("Nome: "),
                          Text("Cognome: "),
                        ],
                      )
                    ],
                  ),
                ],
              ),),
            //Generale
            Card(
              elevation: 10,
              child: Column(
                children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Generale",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        ),),
                    alignment: Alignment.center,
                  ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Tema Scuro: "),
                        Switch(
                          value:isDarkModeEnabled,
                          onChanged: (bool value){
                            setState(() {isDarkModeEnabled = value;});
                          },
                        )
                      ],
                    )
                  ],
                ),
                ],
            
            ),
            )
            ]
            
        ),
      )
    );
  }
}