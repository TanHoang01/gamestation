import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/models/contentMessage.dart';
import 'package:gamestation/models/user_model.dart';
import 'package:gamestation/models/users.dart';
import 'package:iconsax/iconsax.dart';

class messageClientScreen extends StatefulWidget {
  messageClientScreen(
      {Key? key})
      : super(key: key);

  @override
  _messageClientScreenState createState() =>
      _messageClientScreenState();
}

class _messageClientScreenState extends State<messageClientScreen> {
  String uid = auth.FirebaseAuth.instance.currentUser!.uid;
  String uid2 = '0wljuA9yIdRyMXQMKXTAmIbDWsJ2';
  String messagesId = "";
  late Content content = Content(
      contentId: '',
      userId: '',
      messageId: '',
      message: '',
      createAt: '',
      timeSendDetail: '');
   User user = User('', '', '', '', '', [], '');
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> messageFormKey = GlobalKey<FormState>();
  String message = '';
  String messageId='';

  Future getUserDetail() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(auth.FirebaseAuth.instance.currentUser!.uid).get().then((value) {
          setState(() {
             user = User.fromJson(value.data()!);
             messageId = user.messageId.toString();
             print(user.fullname);
             print(messageId);
             getMessage2();
          });
        });
  }

  late DateTime date = DateTime.now();
  Future sendMessage() async {
    if (messageController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("contents").add({
        'content': messageController.text,
        'sendBy': auth.FirebaseAuth.instance.currentUser!.uid,
        'messageId': messageId,
        'timeSend': '',
        'timeSendDetail': "$date"
      }).then((value) {
        FirebaseFirestore.instance
            .collection("messages")
            .doc(messageId)
            .update({
          'contentList': FieldValue.arrayUnion([value.id]),
        });
        FirebaseFirestore.instance.collection("contents").doc(value.id).update({
          'contentId': value.id,
        });
      });
      FirebaseFirestore.instance.collection("messages").doc(messageId).update({
        'lastMessage': messageController.text,
        'lastTimeSend': "",
      });
    }
  }

  late List contentList;
  late List<Content> chatting = [];

  Future getMessage2() async {
     FirebaseFirestore.instance
        .collection("messages")
        .doc(messageId)
        .snapshots()
        .listen((value1) {
      FirebaseFirestore.instance
          .collection("contents")
          .orderBy('timeSendDetail', descending: false)
          .get()
          .then((value2) {
        setState(() {
          chatting.clear();
          contentList = value1.data()!["contentList"];
          value2.docs.forEach((element) {
            if (contentList.contains(element.data()['contentId'] as String)) {
              chatting.add(Content.fromDocument(element.data()));
            }
          });
        });
      });
    });
  }

  void initState() {
    super.initState();
    getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                   'Admin',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24.0,
                        color: primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 400 - 31,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36.0),
                        topRight: Radius.circular(36.0),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 400,
                            child: Container(
                                // scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 32),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 28, right: 28),
                                      child: ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  SizedBox(height: 16),
                                          itemCount: chatting.length,
                                          itemBuilder: (context, index) {
                                            return 
                                            (auth.FirebaseAuth.instance.currentUser!.uid==
                                                    chatting[index].userId)
                                                ? 
                                                Container(
                                                    // padding: EdgeInsets.only(
                                                    //     left: 28, right: 28),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          chatting[index]
                                                              .createAt,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 10.0,
                                                              color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxWidth:
                                                                      264),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 16,
                                                                  left: 24,
                                                                  bottom: 16,
                                                                  right: 24),
                                                          // height: 73,
                                                          // width: 236 - 12,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24.0)),
                                                            color: Colors.lightBlue,
                                                          ),
                                                          child: Text(
                                                            chatting[index]
                                                                .message,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontSize: 12.0,
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    // padding: EdgeInsets.only(
                                                    //     left: 28, right: 28),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          // height: 54,
                                                          // width: 172,
                                                          constraints:
                                                              BoxConstraints(
                                                                  maxWidth:
                                                                      254),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 16,
                                                                  left: 24,
                                                                  bottom: 16,
                                                                  right: 24),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24.0)),
                                                            color: Colors.grey
                                                          ),
                                                          child: Text(
                                                            chatting[index]
                                                                .message,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Poppins",
                                                                fontSize: 12.0,
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          chatting[index]
                                                              .createAt,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              fontSize: 10.0,
                                                              color: Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                          }),
                                    ),
                                  ],
                                ))),
                        SizedBox(height: 40)
                      ],
                    ),
                  ),
                ),
                Container(
                          height: 54,
                          width: 319+48,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                                border: Border.all(color: Colors.black),
                            color: Colors.black,
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 28),
                              Expanded(
                                  child: Form(
                                key: messageFormKey,
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                    controller: messageController,
                                    // onChanged: (value) => setState(() {
                                    //       message = value;
                                    //     }),
                                    onEditingComplete: () {
                                      setState(() {
                                        sendMessage();
                                        getMessage2();
                                        messageController.clear();
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Type your message...",
                                    )),
                              )),
                              SizedBox(width: 20),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius: BorderRadius.circular(24),
                                    
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.only(right: 8),
                                      // padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          icon: Icon(Iconsax.send1),
                                          iconSize: 18,
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              sendMessage();
                                              getMessage2();
                                              messageController.clear();
                                            });
                                            setState(() {});
                                          })),
                                ),
                              ),
                            ],
                          ),
                        ),
              ],
            ),
          )
        ],
      ),
    );
  }
}