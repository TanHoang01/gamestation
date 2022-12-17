import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamestation/models/messageModel.dart';
import 'package:gamestation/screens/chat/chat_screen_detail.dart';
import 'package:iconsax/iconsax.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class adminMessagesScreen extends StatefulWidget {
  adminMessagesScreen({Key? key}) : super(key: key);

  @override
  _adminMessagesScreenState createState() => _adminMessagesScreenState();
}

class _adminMessagesScreenState extends State<adminMessagesScreen> {

  _adminMessagesScreenState();
  

  String uid = auth.FirebaseAuth.instance.currentUser!.uid;

  String newMessageId = "";
  String messageId = '';
  List assignedMessage = [];


  late List<Message> messagesList = [];
  late List messagesIdList;

  Future getMessage() async {
    FirebaseFirestore.instance
        .collection("messages")
        .snapshots()
        .listen((value2) {
      setState(() {
        messagesList.clear();
        value2.docs.forEach((element) {
          if (uid.contains(element.data()['userId1'] as String) ||
              uid.contains(element.data()['userId2'] as String)) {
            messagesList.add(Message.fromDocument(element.data()));
          }
        });
      });
      print(messagesList.length);
    });
    setState(() {});
  }

  void initState() {
    super.initState();
    getMessage();
  }

  late String task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Container(
                  padding: EdgeInsets.only(right: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.only(left: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Iconsax.arrow_square_left,
                            size: 32, color: Colors.black),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Messages",
                          style: TextStyle(
                              fontFamily: "SFProText",
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),    
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    padding: EdgeInsets.only(left: 28, right: 28),
                    height: 580-88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(top: 16),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    (auth.FirebaseAuth.instance.currentUser!.uid ==
                                            messagesList[index].userId2)
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  messageDetailScreen(
                                                      required,
                                                      uid:
                                                          messagesList[index]
                                                              .userId1,
                                                      uid2: messagesList[index]
                                                          .userId2,
                                                      messagesId:
                                                          messagesList[index]
                                                              .messageId),
                                            ),
                                          )
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  messageDetailScreen(
                                                      required,
                                                      uid:
                                                          messagesList[index]
                                                              .userId2,
                                                      uid2: messagesList[index]
                                                          .userId1,
                                                      messagesId:
                                                          messagesList[index]
                                                              .messageId),
                                            ),
                                          );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                       CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: AssetImage("assets/images/logo.png"),
                                                ),
                                      SizedBox(width: 10),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 64,
                                        width: 232,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                    (auth.FirebaseAuth.instance.currentUser!.uid==
                                                            messagesList[index]
                                                                .userId1)
                                                        ? messagesList[index]
                                                            .name2
                                                        : messagesList[index]
                                                            .name1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontFamily: "SFProText",
                                                        fontSize: 20.0,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.4),
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  messagesList[index]
                                                      .lastTimeSend,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: "SFProText",
                                                      fontSize: 12.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Container(
                                              width: 232,
                                              child: Text(
                                                messagesList[index].lastMessage,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: "SFProText",
                                                    fontSize: 15.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            SizedBox(height: 6)
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          }),
                      // SizedBox(height: 24)
                    ])))
              ],
            ),
          )
        ],
      ),
    );
  }
}