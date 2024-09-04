import 'package:flutter/material.dart';
import 'package:rec_connect/screens/home_screen.dart';
import 'package:rec_connect/screens/login_screen.dart';
import 'package:rec_connect/screens/main_screen.dart';
import 'package:rec_connect/screens/notification_screen.dart';
import 'package:rec_connect/screens/profile_screen.dart';
import 'package:rec_connect/screens/transport_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RecConnect());
}

class RecConnect extends StatelessWidget {
  const RecConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id:(context) => const LoginScreen(),
        MainScreen.id: (context) => const MainScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        Notify.id: (context) => const Notify(),
        Profile.id: (context) => const Profile(),
        Transport.id: (context) => const Transport(),
      },
    );
  }
}
