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

