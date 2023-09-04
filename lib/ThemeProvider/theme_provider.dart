import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode== ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode= isOn ? ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}
class MyTheme{

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black), // Example: headline1 text color
      bodyText1: TextStyle(color: Colors.black), // Example: bodyText1 text color
      bodyText2: TextStyle(
          fontSize: 16,
          color: Colors.white
      ), // Example: bodyText1 text color
      subtitle1: TextStyle(color:Color.fromRGBO(110, 8, 217, 1.0),fontSize: 20,fontWeight:FontWeight.w600,fontFamily:"fonttry" ), // Example: bodyText1 text color
      // Add more styles for other text attributes as needed
    ),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade200,
    colorScheme: const ColorScheme.light(),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white), // Example: headline1 text color
        bodyText2: TextStyle(
            fontSize: 16,
            color: Colors.grey[900]
        ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: Color.fromARGB(255, 47, 2, 131),
      ), // Example: bodyText1 text color
      // Add more styles for other text attributes as needed
    ),
  );
}