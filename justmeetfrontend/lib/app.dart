import 'package:flutter/material.dart';

import 'package:justmeet/utils/route_generator.dart';
import 'package:justmeet/utils/theme.dart';



class App extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  
          
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
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
    //       home: Scaffold(
    
    // //App bar generale
    
    //       appBar:AppBar(
    //           backgroundColor: ThemeHandler.jmTheme().primaryColor,
    //           elevation: 10,
    //           title: Image.asset('assets/logo.png', scale: 2.5),
    //           centerTitle: true,
    //           ),
    
    // //Body = richiama il metodo costruttore Build della pagina all'indice currentIndex
    
    //       body: pageOption[currentIndex],
    
    // //Navigation Bar Generale
    
    //       bottomNavigationBar: NavigationBar(pageIcons: pageIcons, currentIndex: currentIndex),
    //       ),
        );
}
}


