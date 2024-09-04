import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Color color;
  final String title;
  final void Function() onPressed;

  RoundedButton({required this.color,required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 25.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white,fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}