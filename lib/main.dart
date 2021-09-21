import 'package:chat_app/ui/screens/chat_screen.dart';
import 'package:chat_app/ui/screens/login_screen.dart';
import 'package:chat_app/ui/screens/chat_room_screen.dart';
import 'package:chat_app/ui/screens/register_screen.dart';
import 'package:chat_app/ui/screens/startup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.StartScreenRoute,
      theme: ThemeData.dark(),
      routes: {
        StartScreen.StartScreenRoute: (context) => StartScreen(),
        ChatRoom.chatRoomScreenRoute: (context) => ChatRoom(),
        LoginScreen.loginScreenRoute: (context) => LoginScreen(),
        RegisterScreen.registerScreenRoute: (context) => RegisterScreen(),
        ChatScreen.chatScreenRoute: (context) => ChatScreen(),
      },
    );
  }
}
