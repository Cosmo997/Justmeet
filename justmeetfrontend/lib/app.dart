import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'view/routes/homepage.dart';
import 'view/routes/eventcreator.dart';


class App extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  return AppState();
  }
}

class AppState extends State<App>{

  int currentIndex = 1;
  final pageOption = [
    HomePage(),
    EventCreator()
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false, //Disabilita la scritta "debug" in alto a destra
      themeMode: ThemeMode.dark,
      home: Scaffold(

//App bar generale

        appBar:AppBar
                  (backgroundColor: Colors.black,
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
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.black,  
      items: <Widget>[
      // Icon(Icons.favorite, size: 18, color: Colors.white,),
      Icon(Icons.home, size: 18, color: Colors.white),
      //Icon(Icons.message, size: 18, color: Colors.white,),
      Icon(Icons.add_circle_outline, size: 18, color: Colors.white,),
      ],
        animationDuration: Duration(
          milliseconds: 600,
            ),
              index: currentIndex,
                onTap: (index){
                  setState(() {
                    currentIndex = index;
                                 });
                                },
                              ),
      )
    );
  }
  
}