import 'package:flutter/material.dart';

Widget defaultTitleWidget({
    required title,
    required leadingIcon,
    Function? onPressed,
})=>  Row(
    children: [
        Icon(
            leadingIcon,
        ),
        SizedBox(
            width: 15,
        ), // Add some spacing between icon and text
        Text(
            title,
            style: TextStyle(
                fontSize: 16,
            ),
        ),
        Spacer(),
        IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.chevron_right_outlined,
            ),
        ),
    ],
);


class BottomNavBar extends StatelessWidget {
    final int selectedIndex;
    final ValueChanged<int> onItemTapped;

    const BottomNavBar({required this.selectedIndex, required this.onItemTapped});

    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 137, 46, 227), // Change the border color here
                        width: 2.0, // Border width
                    ),
                ),
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(90)), // Set the border radius here

                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: selectedIndex,
                    onTap: onItemTapped,
                    selectedItemColor: const Color.fromARGB(
                        255, 89, 16, 138), // Mint-green color for selected icon
                    unselectedItemColor: const Color.fromARGB(
                        255, 212, 188, 228), // Purple color for unselected icon
                    backgroundColor: const Color.fromARGB(255, 243, 221, 240),

                    items: const <BottomNavigationBarItem>[
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
            ),
        );
    }
}
