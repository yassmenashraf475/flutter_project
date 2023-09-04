import 'package:flutter/material.dart';
import 'package:flutter_project/ThemeProvider/theme_change.dart';
import 'package:flutter_project/components/components.dart';
import 'package:flutter_project/modules/welcome/welcome.dart';
import 'package:flutter_project/network/remote/firebasehelper.dart';

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
      backgroundColor: Colors.transparent,
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
                              '${FireBaseHelper().auth.currentUser?.displayName}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${FireBaseHelper().auth.currentUser?.email}',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: ()async{
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>welcome()));
                            await FireBaseHelper().signOut();
                            FireBaseHelper().signOut();
                            },
                          icon: Icon(
                            Icons.logout,
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
                        color: Colors.grey.shade300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultTitleWidget(
                              style:Theme.of(context).textTheme.bodyText1,
                                title: 'My Orders',
                                leadingIcon: Icons.fire_truck_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTitleWidget(
                              style:Theme.of(context).textTheme.bodyText1,
                              title: 'My Favourite',
                              leadingIcon: Icons.favorite_border_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTitleWidget(
                              style:Theme.of(context).textTheme.bodyText1,
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
                        height: 160,
                        color: Colors.grey.shade300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultTitleWidget(
                              style:Theme.of(context).textTheme.bodyText1,
                              title: 'Language',
                              leadingIcon: Icons.language_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTitleWidget(
                              style:Theme.of(context).textTheme.bodyText1,
                              title: 'Settings',
                              leadingIcon: Icons.settings,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        height: 110,
                        color: Colors.grey.shade300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      //   Row(
                      //   children: [
                      //   Icon(Icons.dark_mode_outlined),
                      //   SizedBox(width: 8),
                      //   Text('Dark Mode'),
                      //   Spacer(),
                      //   Switch(
                      //     activeColor: Colors.deepPurple[400],
                      //     value: isDarkModeEnabled,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         isDarkModeEnabled = value;
                      //       });
                      //     },
                      //   ),
                      //
                      //
                      //   ],
                      // )
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.dark_mode_rounded,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                const Expanded(
                                  child: Text(
                                    "Dark Theme",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ChangeThemeButtonWidget(),
                                ),
                              ],
                            ),

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
