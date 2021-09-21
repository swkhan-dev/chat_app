import 'package:chat_app/ui/custom_widgets/profiles_list_row.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/core/constants/colors.dart';
import 'package:chat_app/core/constants/styles.dart';
import 'package:chat_app/ui/custom_widgets/icon_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
User? loggedInUser;
int messageNumber = 0;

class ChatScreen extends StatefulWidget {
  static const chatScreenRoute = 'chat_screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;

  String textMessage = '';
  List<ChatBox> messages = [
    ChatBox(
      imageUrl: 'images/shahwali.jpg',
      message: 'Hello there!',
    ),
    ChatBox(
      imageUrl: 'images/shahwali.jpg',
      message:
          'My Name is Shahwali khan and i am a flutter developer sekking for internship opportunities. If any company ha vaccancies, I am ready to work',
    ),
  ];
  IconData icon = Icons.mic_none_outlined;
  TextEditingController controller = TextEditingController();
  //Getting current user info
  void getCurrentUser() {
    loggedInUser = _auth.currentUser;
  }

  void getData() async {
    await for (var doc in _firestore.collection('messages').snapshots()) {
      for (var data in doc.docs) {
        print(data.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          leading: AppBarIconButton(
            iconData: Icons.arrow_back_ios_sharp,
          ),
          elevation: 0,
          actions: [
            AppBarIconButton(
              onTap: () {},
              iconData: Icons.logout,
            ),
          ],
          title: Text(
            "Chat",
            style: kAppbarTitleStyle,
          ),
          centerTitle: true,
          backgroundColor: kBackgroundColor,
        ),
        body: Column(
          children: [
            Expanded(child: GetStream()),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      size: 30.0,
                      color: kLastMessageColor,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        setState(() {
                          if (value == '') {
                            icon = Icons.mic_none_outlined;
                          } else {
                            icon = Icons.send_outlined;
                          }
                          textMessage = value;
                        });
                      },
                      minLines: 1,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                          fontSize: 20, color: Colors.white, height: 1),
                      decoration: InputDecoration(
                          hintText: "Type your message",
                          hintStyle:
                              TextStyle(fontSize: 20, color: kLastMessageColor),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      child: Icon(Icons.camera_alt_outlined),
                      backgroundColor: Colors.blue.shade800,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _firestore.collection('messages').add({
                        'sender': loggedInUser!.email,
                        'text': textMessage,
                        'index': messageNumber,
                      });
                      messageNumber++;
                      controller.clear();
                      icon = Icons.mic_none_outlined;
                      setState(() {});
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.blue.shade800,
                        child: Icon(icon)),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class GetStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _firestore
            .collection('messages')
            .orderBy('index', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          List<ChatBox> messages = [];
          for (var doc in snapshot.data!.docs) {
            String sender = doc['sender'];
            String text = doc['text'];
            String? user = loggedInUser!.email;

            final messageWidget = ChatBox(
              imageUrl: 'images/shahwali.jpg',
              message: text,
              isCurrentUser: sender == user,
            );

            messages.add(messageWidget);
          }
          return ListView(
            reverse: true,
            children: messages,
          );
        });
  }
}
