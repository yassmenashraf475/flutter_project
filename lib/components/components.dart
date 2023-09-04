import 'package:flutter/material.dart';

Widget defaultTitleWidget({
    required title,
    required leadingIcon,
    required style,
    Function? onPressed,
})=>  Row(
    children: [
        Icon(
            leadingIcon,
            color: Colors.black
        ),
        SizedBox(
            width: 15,
        ), // Add some spacing between icon and text
        Text(
            title,
            style: style,
        ),
        Spacer(),
        IconButton(
            onPressed: (){},
            icon: Icon(
                Icons.chevron_right_outlined,color: Colors.black,
            ),
        ),
    ],
);

