import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
    HomePageState createState() => HomePageState();
  }

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          elevation: 10,
          title: Image.asset('assets/logo.png', scale: 2.5),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: Container(
        //  child: Center(
        //    child: Text("Benvenuto", style: TextStyle(fontSize: 50))
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[            
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black54),
                accountEmail: Text("Evento: sgnipsi"), 
                accountName: Text("Descrizione: sgnipsignepsdfjoeijedi"),
               margin: EdgeInsets.only(top: 20, left: 10, right: 10) ,
              ),
            ],
          ),
        
            ),
        );
  }

  
}