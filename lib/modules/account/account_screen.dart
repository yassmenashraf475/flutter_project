import 'package:flutter/material.dart';
import 'package:flutter_project/components/components.dart';

import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {


  bool isDarkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SafeArea(
          child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage('assets/images/profilepicture.jpg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Name',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'username@111111',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.edit,
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        height: 205,
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultTitleWidget(
                                title: 'My Orders',
                                leadingIcon: Icons.fire_truck_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTitleWidget(
                              title: 'My Favourite',
                              leadingIcon: Icons.favorite_border_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTitleWidget(
                              title: 'Card',
                              leadingIcon: Icons.shopping_bag_outlined,
                            ),
          
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        height: 205,
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultTitleWidget(
                              title: 'Language',
                              leadingIcon: Icons.language_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTitleWidget(
                              title: 'Settings',
                              leadingIcon: Icons.settings,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTitleWidget(
                              title: 'Logout',
                              leadingIcon: Icons.logout,
                            ),
          
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        height: 90,
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                        children: [
                        Icon(Icons.dark_mode_outlined),
                        SizedBox(width: 8),
                        Text('Dark Mode'),
                        Spacer(),
                        Switch(
                          activeColor: Colors.deepPurple[400],
                          value: isDarkModeEnabled,
                          onChanged: (value) {
                            setState(() {
                              isDarkModeEnabled = value;
                            });
                          },
                        ),
                        ],
                      )
                          ],
                        ),
                      ),
          
                    ],
                  ),
          
                ],
                ),
            ),
          )
      ),

    );
  }
}
