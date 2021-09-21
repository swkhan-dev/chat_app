import 'package:chat_app/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/styles.dart';

class ProfileListTile extends StatelessWidget {
  final String url;
  final String name;
  ProfileListTile({this.url = '', this.name = ''});

  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(url),
          ),
          title: Text(
            name,
            style: kTitleStyle,
          ),
          subtitle: Text(
            'Flutter Developer',
            style: kSubtitleStyle,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'time',
                style: kTitleStyle,
              ),
              SizedBox(
                height: 6,
              ),
              Icon(
                Icons.circle,
                color: Color(0xff0a3fff),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
