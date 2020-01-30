import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/theme.dart';

class AreaRiservata extends StatefulWidget{
  
  //TODO vuole USER in ingresso

  @override
  State<StatefulWidget> createState() {
    return AreaRiservataState();
      }
    }
  

  class AreaRiservataState extends State<AreaRiservata>{
    
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
                           //backgroundImage: AssetImage("nu"),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Tema Scuro: "),
                        Switch(
                          value:ThemeHandler.isDarkThemeEnabled,
                          onChanged: (bool value){
                            setState(() {ThemeHandler.changeTheme();});
                          },
                        )
                      ],
                    )
                  ],
                ),
                Divider(height: 10),
                  ListTile(
                    title: Text("I miei Eventi"),
                    leading: Icon(Icons.person_outline),
                    //Apre pagina degli eventi creati dall'utente.
                    onTap: () => {},
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(height: 10),
                  ListTile(
                    title: Text("Eventi Preferiti"),
                    leading: Icon(Icons.favorite),
                    //Apre pagina con gli eventi preferiti dell'utente.
                    onTap: () => {},
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(height: 10,)
                ],
            
            ),
            ),
            Container(decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                 ),
                 margin: EdgeInsets.all(10),
              child: Card(
                child: IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.exit_to_app),
                  onPressed:() => AuthProvider().logOut(),
                  tooltip: "LogOut",
                  color: ThemeHandler.jmTheme().accentColor,
                ),
              ),
            )
            ]
        ),
      ),
    );
  }
}