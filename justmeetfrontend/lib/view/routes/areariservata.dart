import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/classi/user.dart';
import 'package:justmeet/utils/controllerjm.dart';
import 'package:justmeet/utils/firebase_auth.dart';
import 'package:justmeet/utils/theme.dart';

class AreaRiservata extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return AreaRiservataState();
      }
    }
  

  class AreaRiservataState extends State<AreaRiservata>{
    
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    
       body: FutureBuilder(
       future: ControllerJM.getUserById(AuthProvider.getUId()),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot){
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
          else{
            return Container(
    child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10,0, 0),
                  child: Text("Area Riservata", style: TextStyle(color: ThemeHandler.jmTheme().accentColor, fontSize: 20))),
                Divider(color: ThemeHandler.jmTheme().accentColor, indent: 40, endIndent: 40,),
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
                              child: Image.asset('assets/images/iconaUser.png'),
                             //backgroundImage: NetworkImage(),
                           )
                         ),
                            alignment: Alignment.topLeft,
                          ),
                        Column(
                          children: <Widget>[
                            Text("Nome: " +snapshot.data.nome),
                            Text("Cognome: " +snapshot.data.cognome),
                            Text("Email: " +snapshot.data.email),
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
                  ],
              ),
              ),
              
              Container(
                decoration: BoxDecoration(
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
              ),
              Text("LogOut"),
              ]
          ),
        ),
           );
         }
       }
      ),
    );
  }
}

