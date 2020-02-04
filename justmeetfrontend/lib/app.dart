import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justmeet/utils/route_generator.dart';
import 'package:justmeet/utils/theme.dart';
import 'package:justmeet/view/routes/areariservata.dart';
import 'package:justmeet/view/routes/eventcreator.dart';
import 'package:justmeet/view/routes/homepage.dart';
import 'package:justmeet/view/routes/homepageanonima.dart';
import 'package:justmeet/view/routes/preferiti.dart';



class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
        static FirebaseUser currentUser;
        int currentIndex = 0;
        final pageOption = [
          HomePage(),
          EventCreator(),
          Preferiti(),
          AreaRiservata()];

        var pageIcons = [
            Icon(Icons.home, size: 30),
            Icon(Icons.add_circle, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.accessible_forward, size: 30),   
                  ];

    @override
    initState() { 
      super.initState();
    }
    
      @override
      Widget build(BuildContext context) {
         return StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged ,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot);
            if(!snapshot.hasData || snapshot.data == null){
            return MaterialApp(
              title: "JustMeet",
              theme: ThemeHandler.jmTheme(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              home: HomepageAnonima()
            );
            }
            else{
            return MaterialApp(
          title: "JustMeet",
          theme: ThemeHandler.jmTheme(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
           home: Scaffold(
     //App bar generale
           appBar:AppBar(
               backgroundColor: ThemeHandler.jmTheme().primaryColor,
               elevation: 10,
               title: Image.asset('assets/images/logo.png', scale: 2.5),
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
            onTap: (index){setState(() {
              currentIndex = index;
            });})
      ),
          );
          }
          },
        );
        
}

}





