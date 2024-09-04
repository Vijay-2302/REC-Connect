import 'package:flutter/material.dart';
import 'package:rec_connect/screens/profile_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "REC Connect",
        style: TextStyle(
          fontFamily: "KaushanScript",
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      elevation: 10.0,
      backgroundColor: const Color(0xFF7C4BCE),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Profile.id);
          },
          icon: const Icon(FontAwesomeIcons.solidCircleUser),
          iconSize: 35.0,
        ),
      ],
    );
  }
}
