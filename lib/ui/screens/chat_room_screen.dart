import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/ui/custom_widgets/icon_button.dart';
import 'package:chat_app/ui/custom_widgets/list_tile.dart';

class ChatRoom extends StatefulWidget {
  static const String chatRoomScreenRoute = 'main_screen';
  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  List<ProfileListTile> profiles = [
    ProfileListTile(
      name: "Shah Wali Khan",
      url: "images/shahwali.jpg",
    ),
    ProfileListTile(
      name: "Saifullah Khan",
      url: "images/saifullah.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIconButton(
            iconData: Icons.arrow_back_ios_sharp,
          ),
          elevation: 0,
          actions: [
            AppBarIconButton(
              iconData: Icons.search_sharp,
            ),
          ],
          title: Text(
            'Chats',
            style: kAppbarTitleStyle,
          ),
          centerTitle: true,
          backgroundColor: kBackgroundColor,
        ),
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 20.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return profiles[index];
            },
            itemCount: profiles.length,
          ),
        ),
      ),
    );
  }
}
