import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeHandler{
  
  static bool isDarkThemeEnabled = false;

  static ThemeData jmTheme() {
  if(isDarkThemeEnabled){
  ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryColor: Colors.grey[500],
      
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.orange[400],
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20.0,
      ),
      buttonColor: Colors.orange[400],
      secondaryHeaderColor: Colors.grey[300],
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        unselectedLabelColor: Colors.grey,
      ));
  }
  else
{
  ThemeData base = ThemeData.dark();
  return base.copyWith(
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

    
}

