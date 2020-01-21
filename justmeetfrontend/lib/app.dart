import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:justmeet/utils/theme.dart';
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
  
  int currentIndex = 0;
  
  final pageOption = [
    HomePage(),
    EventCreator(),
    Preferiti(),
    AreaRiservata(),
  ];

  var pageIcons =[
            Icon(Icons.home, size: 30),
            Icon(Icons.add_circle, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.accessible_forward, size: 30),   
          ];
          
  @override
  void initState() {
    super.initState();
  } 
    
    
      @override
      Widget build(BuildContext context) {
    
        return MaterialApp(
          title: "JustMeet",
          theme: ThemeHandler.jmTheme(),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
    
    //App bar generale
    
          appBar:AppBar(
              backgroundColor: ThemeHandler.jmTheme().primaryColor,
              elevation: 10,
              title: Image.asset('assets/logo.png', scale: 2.5),
              centerTitle: true,
              ),
    
    //Body = richiama il metodo costruttore Build della pagina all'indice currentIndex
    
          body: pageOption[currentIndex],
    
    //Navigation Bar Generale
    
          bottomNavigationBar: CurvedNavigationBar(
          
          height: 50,
          color: ThemeHandler.jmTheme().primaryColor,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: ThemeHandler.jmTheme().primaryColor,  
          items: pageIcons,
          animationDuration: Duration(milliseconds: 600),
          index: currentIndex,
          onTap: (index){setState(() {currentIndex = index;});
                                    },
                                  ),
          ),
            
        );
    
    
      
  
}}