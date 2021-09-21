import 'package:chat_app/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  static const String registerScreenRoute = 'register_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isTrue = false;
  String name = '';
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
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: kTextFieldTextStyle,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      kTextFieldStyle.copyWith(hintText: 'Enter your Name'),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: kTextFieldTextStyle,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldStyle.copyWith(hintText: 'Enter Email'),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 40,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  textAlignVertical: TextAlignVertical.bottom,
                  style: kTextFieldTextStyle,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldStyle.copyWith(hintText: 'Enter Password'),
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
                      final user = await _auth.createUserWithEmailAndPassword(
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
                    'Register',
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
