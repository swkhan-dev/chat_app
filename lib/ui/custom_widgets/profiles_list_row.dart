import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/colors.dart';

class ChatBox extends StatelessWidget {
  final bool isCurrentUser;
  final String imageUrl;
  final String message;
  ChatBox({this.imageUrl = '', this.message = '', this.isCurrentUser = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: 25, bottom: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          isCurrentUser
              ? CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage(imageUrl),
                )
              : Container(),
          SizedBox(
            width: 20,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
                padding: EdgeInsets.all(15),
                decoration: isCurrentUser
                    ? BoxDecoration(
                        color: kLastMessageColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)))
                    : BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: isCurrentUser
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(
                      message,
                      style: isCurrentUser
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'time',
                      style: isCurrentUser
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
