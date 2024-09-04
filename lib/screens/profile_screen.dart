import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rec_connect/components/rounded_button.dart';
import 'package:rec_connect/screens/login_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String id = 'profile_screen';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User loggedInUser;
  String userEmail = "";
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        loggedInUser = user;
        userEmail = loggedInUser.email!;
        print(userEmail);
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
              fontFamily: "KaushanScript",
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          backgroundColor: const Color(0xFF7C4BCE),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.solidCircleUser,
                color: Colors.grey.shade500,
                size: 100.0,
              ),
            ),
            // const Icon(
            //   FontAwesomeIcons.solidCircleUser,
            //   color: Colors.white,
            //   size: 100.0,
            // ),
            const SizedBox(
              height: 80.0,
            ),
            Card(
              color: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 0,
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(Icons.mail, color: Color(0xFF7C4BCE)),
                title: Text(
                  userEmail,
                  style: const TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 15.0,
                      color: Colors.black),
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // const Padding(padding: EdgeInsets.only(top: 150.0)),
                  RoundedButton(
                      color: Colors.green,
                      title: "Change Password",
                      onPressed: () {
                        setState(() {
                          Alert(
                              context: context,
                              title: "Reset Password?",
                              desc: "Press \"OK\" to reset your Password.",
                              buttons: [
                                DialogButton(
                                  child: const Text("Ok"),
                                  onPressed: () {
                                    _auth.sendPasswordResetEmail(
                                        email: userEmail);
                                    Navigator.pop(context);
                                    Alert(
                                        context: context,
                                        title: "Mail Sent!",
                                        desc:
                                            "Password Reset link has been sent to your mail-id.",
                                        buttons: [
                                          DialogButton(
                                              child: const Text("Close"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              })
                                        ]).show();
                                  },
                                ),
                                DialogButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ]).show();
                        });
                      }),
                  RoundedButton(
                      color: Colors.red,
                      title: "Logout",
                      onPressed: () {
                        _auth.signOut();
                        Navigator.popAndPushNamed(context, LoginScreen.id);
                      })
                ],
              ),
            )
          ],
        ));
  }
}
// IconButton(onPressed: (){
// Navigator.pop(context);
// },
// icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
// iconSize: 35.0,
// padding: const EdgeInsets.only(right: 20.0),
// ),
