import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String loginScreenRoute = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isTrue = false;
  String email = '';
  String password = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isTrue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'animate',
                child: Container(
                  height: 130,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 40,
                child: TextField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: kTextFieldTextStyle,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldStyle.copyWith(hintText: 'Enter Email'),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 40,
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: kTextFieldTextStyle,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldStyle.copyWith(hintText: 'Enter Password'),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isTrue = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushNamed(context, ChatScreen.chatScreenRoute);
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      isTrue = false;
                    });
                  },
                  child: Text(
                    'Login',
                    style: kTextFieldTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
