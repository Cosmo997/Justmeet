import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Classe esempio per l'utilizzio di data e ora in un progetto flutter.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: 
      MyHomePage(title: 'Date & Time Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  }


class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDate = DateTime.now();	
  TimeOfDay _selectedTime = TimeOfDay.now();

  void getData(context) async {
     //scegliere la data
     var fDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
   );
     //aggiornare lo stato
     if (fDate != null) setState(() => _selectedDate = fDate);

  }

  void getTime(context) async {
    var fTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime
    );
    if (fTime != null) setState(() => _selectedTime = fTime);
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat df = DateFormat("dd/MM/yyyy");

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)), 
        
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text(df.format(_selectedDate)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getData(context),
                     )

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Text(_selectedTime.format(context)),
              IconButton(
                       icon: Icon(Icons.date_range),
                       onPressed: () => getTime(context),
                     )

            ],
          ),          
        ],
      ),
    ); 
  } //build context
}
