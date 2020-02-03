import 'package:flutter/material.dart';


class SinginPage extends StatefulWidget {
  SinginPage({Key key}) : super(key: key);

  @override
  _SinginPageState createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: SingleChildScrollView(
         child: Column(
           children: <Widget>[
             //NOME
             TextField(),
             //COGNOME
             TextField(),
             //EMAIL
             TextField(),
             //PASSWORD
             TextField(),
             //CONFERMA PASSWORD
             TextField(),

           ],
           
         ),
       ),
    );
  }
}