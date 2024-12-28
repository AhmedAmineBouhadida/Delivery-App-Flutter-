import 'package:flutter/material.dart'; 

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: Colors.grey.shade500,
    seedColor: Colors.grey.shade100,
    brightness: Brightness.light,
    secondary: Colors.grey.shade100,  
    tertiary: Colors.white, 
    inversePrimary: Colors.grey.shade700, 
  ),
);
