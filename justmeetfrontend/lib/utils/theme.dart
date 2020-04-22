import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Responsabilità: "Gestire il Tema dell'applicazione"
class ThemeHandler{
  
  static bool isDarkThemeEnabled = false;

  static ThemeData jmTheme() {
  if(isDarkThemeEnabled){
  ThemeData base = ThemeData.light();
  return base.copyWith(
      //cardColor: Colors.black.withOpacity(0),
      bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0)),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.orange[400],
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20.0,
      ),
      buttonColor: Colors.orange[400],
      secondaryHeaderColor: Colors.grey[400],
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        unselectedLabelColor: Colors.white,
      ));
  }
  else
{
  ThemeData base = ThemeData.dark();
  return base.copyWith(
      //cardColor: Colors.black.withOpacity(0),
      bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0)),
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[700],
      accentColor: Colors.orange[400],
      iconTheme: IconThemeData(
        color: Colors.grey,
        size: 20.0,
      ),
      buttonColor: Colors.orange[400],
      secondaryHeaderColor: Colors.grey[600],
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
  }


}

  static changeTheme(){isDarkThemeEnabled = !isDarkThemeEnabled;}

  static bool getCurrentThema(){
    if(isDarkThemeEnabled)
    return true;
    else 
    return false;
  }

    
}

