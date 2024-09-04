import 'package:flutter/material.dart';
import 'custom_appbar.dart';

class Department extends StatefulWidget {
  const Department({required this.title});
  final String title;

  @override
  State<Department> createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.pink,
    );
  }
}
