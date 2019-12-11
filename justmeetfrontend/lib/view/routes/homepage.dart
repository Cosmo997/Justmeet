import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget{
  @override
    HomePageState createState() => HomePageState();
  }

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {

    var appBarIniziale = AppBar(
              backgroundColor: Colors.black54,
              elevation: 10,
              title: Image.asset('assets/logo.png', scale: 2.5),
              centerTitle: true,
            );

    return new Scaffold(
      
        appBar: appBarIniziale,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
        bottomNavigationBar: CurvedNavigationBar(
                    color: Colors.black54,
                    backgroundColor: Colors.white24,
                    buttonBackgroundColor: Colors.black54,
                    items: <Widget>[
                      Icon(Icons.favorite, size: 18,),
                      Icon(Icons.home, size: 18,),
                      Icon(Icons.message, size: 18,),
                      Icon(Icons.add_circle_outline, size: 18),
                    ],
                    animationDuration: Duration(
                      milliseconds: 300,
                    ),
                    
                    index: 1,
                    onTap: (index){
                      print("Current Index: $index");
                    },
                    
                  ),
        
        
        );
  }

  
}