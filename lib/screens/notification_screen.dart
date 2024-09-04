import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);
  static const String id = 'notification_screen';
  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
