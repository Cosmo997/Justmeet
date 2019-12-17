import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      
      body: Container(
        child: Center(
          child: Text("Area Riservata"),),
      )
    );
  }
}