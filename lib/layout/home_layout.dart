import 'package:flutter/material.dart';
import 'package:flutter_project/modules/account/account_screen.dart';
import 'package:flutter_project/modules/favourite/favourite_screen.dart';
import 'package:flutter_project/modules/home/home_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  int currentIndex = 0;

  List<Widget> screens=[
    MyHomePage(),
    FavScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor:  Color.fromARGB(
              255, 89, 16, 138), // Mint-green color for selected icon
          unselectedItemColor:  Color.fromARGB(
              255, 212, 188, 228),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          backgroundColor:  Color.fromARGB(255, 243, 221, 240),

          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
      ),

    );
  }
}
