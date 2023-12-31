import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ThemeProvider/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      activeColor: Colors.deepPurple,
      value: themeProvider.isDarkMode,
      onChanged: (bool value) {
        final provider = Provider.of<ThemeProvider>
          (context,listen:false );
        provider.toggleTheme(value);
      },

    );
  }

}