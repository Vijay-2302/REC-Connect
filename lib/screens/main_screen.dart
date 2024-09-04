import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rec_connect/departments.dart';
import 'notification_screen.dart';
import 'transport_screen.dart';
import 'home_screen.dart';
import 'package:rec_connect/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String id = 'main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      try {
        loggedInUser = user;
        print(loggedInUser.email);
      } catch (e) {
        print(e);
      }
    }
  }

  final List<Widget> _widgetOptions = <Widget>[
    const Notify(),
    const HomeScreen(),
    const Transport(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                "Departments",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(color: Color(0xFF7C4BCE)),
            ),
            ListTile(
                leading: const Icon(
                  FontAwesomeIcons.computer,
                  size: 20.0,
                ),
                title: const Text("Computer Science"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Department(
                      title: 'Computer Science',
                    );
                  }));
                }),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.networkWired,
                size: 20.0,
              ),
              title: const Text("Information Technology"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Department(
                    title: 'Information Technology',
                  );
                }));
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidBell), label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bus), label: "Transport"),
        ],
        backgroundColor: const Color(0xFF7C4BCE),
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            print(_selectedIndex);
          });
        },
      ),
    );
  }
}
