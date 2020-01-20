import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:justmeet/view/routes/preferiti.dart';
import 'view/routes/areariservata.dart';
import 'view/routes/eventcreator.dart';
import 'view/routes/homepage.dart';


class App extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  
  bool isDarkThemeEnabled = false;
  int currentIndex = 0;
  final pageOption = 
  [
    HomePage(),
    EventCreator(),
    Preferiti(),
    AreaRiservata(),
  ];
  final ThemeData temaApp = ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
        accentColor: Colors.orange[400],
        );
  


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "JustMeet",
      theme: isDarkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(

//App bar generale

      appBar:AppBar(
          backgroundColor: temaApp.primaryColor,
          elevation: 10,
          title: Image.asset('assets/logo.png', scale: 2.5),
          centerTitle: true,
          ),

//Body = richiama il metodo costruttore Build della pagina all'indice currentIndex

      body: pageOption[currentIndex],

//Navigation Bar Generale

      bottomNavigationBar: CurvedNavigationBar(
      
      height: 50,
      color: Colors.black,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.black,  
      items: <Widget>
      [
        Icon(Icons.home, size: 30, color: Colors.white,),
        Icon(Icons.add_circle, size: 30, color: Colors.white,),
        Icon(Icons.favorite, size: 30, color: Colors.white,),
        Icon(Icons.accessible_forward, size: 30, color: Colors.white,),
        
      ],
      animationDuration: Duration(milliseconds: 600),
      index: currentIndex,
      onTap: (index){setState(() {currentIndex = index;});
                                },
                              ),
      )
    );
  }
  
}