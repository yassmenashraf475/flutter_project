import 'package:flutter/material.dart';

import '../../components/components.dart';
import '../account/account_screen.dart';
import '../home/home_screen.dart';


class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreentState();
}

class _FavScreentState extends State<FavScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavScreen()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountScreen()));
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
