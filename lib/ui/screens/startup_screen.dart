import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/ui/screens/login_screen.dart';
import 'package:chat_app/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const String StartScreenRoute = 'start_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'animate',
                  child: Container(
                    height: 100,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                AnimatedTextKit(animatedTexts: [
                  WavyAnimatedText("Chat App",
                      textStyle: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Source Sans Pro")),
                ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.loginScreenRoute);
                },
                child: Text("Login")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, RegisterScreen.registerScreenRoute);
                },
                child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
