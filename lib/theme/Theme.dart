import 'package:flutter/material.dart';
import 'package:menzil_yoly/theme/gnav_styles.dart';

//Light Mode ucin
ThemeData light_mode = ThemeData(
  colorScheme: ColorScheme.light(
    brightness: Brightness.light
  ),
  

// Icon Mode ucin
  iconTheme: IconThemeData(
    color: Colors.black,
    size: 25
  ),
  

// Draw Menu ucin
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white,
  ),
  

// AppBar Menu ucin  
appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.black
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
    )
  ),


// Divider ucin
  dividerTheme: DividerThemeData(
    color: Colors.black,
    thickness: 0.5
  ),


// Bottom App ucin
  extensions: <ThemeExtension<dynamic>>[
    GNavTheme.light
  ],
  

// Text ucin
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
    titleMedium: TextStyle(fontSize: 20, color: Colors.black),
    titleSmall: TextStyle(fontSize: 18, color: Colors.black),
  ),


//body background ucin
  scaffoldBackgroundColor: Colors.white,


);


//Dark Mode ucin
ThemeData dark_mode = ThemeData(
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark
  ),


// Icon Mode ucin
  iconTheme: IconThemeData(
    color: Colors.white,
    size: 25
  ),


// Draw Menu ucin
  drawerTheme: DrawerThemeData(
    backgroundColor: const Color.fromARGB(221, 55, 54, 54),
  ),


// AppBar Menu ucin  
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
    )
  ),


// Divider ucin
  dividerTheme: DividerThemeData(
    color: Colors.white,
    thickness: 0.5
  ),


// Bottom App ucin
  extensions: <ThemeExtension<dynamic>>[
    GNavTheme.dark
  ],

  
// Text ucin
  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    bodySmall: TextStyle(fontSize: 14, color: Colors.white),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    titleMedium: TextStyle(fontSize: 20, color: Colors.white),
    titleSmall: TextStyle(fontSize: 18, color: Colors.white),
  ),


//body background ucin
  scaffoldBackgroundColor: const Color.fromARGB(135, 78, 76, 76),

);