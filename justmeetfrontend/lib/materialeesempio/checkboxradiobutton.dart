import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  MyHomePage(title: 'Checkbox & Radio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  }

enum OpzioniSesso { maschio, femmina }
enum OpzioniLavoro { disoccupato, occupato, pensionato }

class _MyHomePageState extends State<MyHomePage> {
 bool cbState = false;
 OpzioniSesso radioSesso = OpzioniSesso.maschio;
 OpzioniLavoro radioLavoro = OpzioniLavoro.disoccupato;

 void onRadioSessoTap(newValue) {
   setState(() => radioSesso = newValue);
 }

 void onRadioLavoroTap(newValue) {
   setState(() => radioLavoro = newValue);
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)), 
        
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        
          Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text('CheckBoxes Demo'),
               Checkbox(
                 tristate: true,
                 activeColor: Colors.green,
                 checkColor: Colors.red,
                 value: cbState,
                 onChanged: (v) {
                   setState(() => cbState = v);
                 },
               ),
              
              Checkbox(
                 tristate: true,
                 activeColor: Colors.yellow,
                 checkColor: Colors.white,
                 value: cbState,
                 onChanged: (v) {
                   setState(() => cbState = v);
                 },
               ),
             ],
           ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: <Widget>[
               Radio(
                 groupValue: radioSesso,
                 value: OpzioniSesso.maschio,
                 onChanged: onRadioSessoTap,
               ),
               Radio(
                 groupValue: radioSesso,
                 value: OpzioniSesso.femmina,
                 onChanged: onRadioSessoTap,
               ),
             ],
           ),
          ),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: <Widget>[
               Radio(
                 groupValue: radioLavoro,
                 value: OpzioniLavoro.disoccupato,
                 onChanged: onRadioLavoroTap,
               ),
               Radio(
                 groupValue: radioLavoro,
                 value: OpzioniLavoro.occupato,
                 onChanged: onRadioLavoroTap,
               ),
               Radio(
                 groupValue: radioLavoro,
                 value: OpzioniLavoro.pensionato,
                 onChanged: onRadioLavoroTap,
               ),
             ],
           ),
          ),

          RaisedButton(
            child: Text("ASSUMI"),
            onPressed: () => setState( 
              () => radioLavoro = OpzioniLavoro.occupato),
          )
        ],
      ),
    );
  } //build context  

}
