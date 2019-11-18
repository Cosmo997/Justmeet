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
          backgroundColor: Colors.black,
          elevation: 10,
          title: Image.asset('assets/logo.png'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Text("Ciao")
            ),
        ),
      );
  }

  
}