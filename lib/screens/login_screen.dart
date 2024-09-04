import 'package:flutter/material.dart';
import 'package:rec_connect/constants.dart';
import 'package:rec_connect/components/rounded_button.dart';
import 'package:rec_connect/screens/main_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
  String errorMessage = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Widget resetField = const Text("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 250.0,
            elevation: 10.0,
            backgroundColor: Color(0xFF7C4BCE),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "REC CONNECT!",
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 70.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Email Address'),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Password'),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  SizedBox(child: resetField),
                  RoundedButton(
                      color: const Color(0xFF7C4BCE),
                      title: "Sign In",
                      onPressed: () async {
                        try {
                          setState(() {
                            showSpinner = true;
                          });

                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          print(user);
                          if (user != null) {
                            setState(() {
                              showSpinner = false;
                            });
                            Navigator.pushNamed(context, MainScreen.id);
                            emailController.clear();
                            passwordController.clear();
                          }
                        } on FirebaseAuthException catch (e) {
                          print(e);
                          if (e.code == 'user-not-found') {
                            setState(() {
                              showSpinner = false;
                              errorMessage = 'No user found for that email.';
                            });
                          } else if (e.code == 'wrong-password') {
                            setState(() {
                              showSpinner = false;
                              errorMessage =
                                  'Wrong password provided for that user.';
                              resetField = TextButton(
                                child: const Text(
                                  "Forgot Password?",
                                ),
                                onPressed: () {
                                  _auth.sendPasswordResetEmail(email: email);
                                  setState(() {
                                    errorMessage =
                                        "Password reset message has been requested to your registered mail-Id                                         mail-id";
                                  });
                                },
                              );
                            });
                          }
                        }
                      }),
                ],
              ),
            ]),
          )
        ],
      ),
    ));
  }
}