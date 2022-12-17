import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/models/user_social.dart';
import 'package:gamestation/screens/dashboard/dashboard.dart';
import 'package:gamestation/screens/message_social/messagesCenter.dart';
import 'package:gamestation/screens/notification/notification.dart';
import 'package:gamestation/screens/profile_social/profile.dart';
import 'package:gamestation/screens/watch/watch.dart';
import 'package:iconsax/iconsax.dart';


class navigationBar extends StatefulWidget {
  String uid;

  navigationBar(required, {Key? key, required this.uid}) : super(key: key);
  @override
  _navigationBar createState() => _navigationBar(uid);
}

class _navigationBar extends State<navigationBar>
    with SingleTickerProviderStateMixin {
  String uid = "";

  _navigationBar(uid);
  TabController? _tabController;
  late userModel user = userModel(
      avatar: '',
      email: '',
      favoriteList: [],
      fullName: '',
      id: '',
      saveList: [],
      follow: [],
      id_social: '',
);

  Future getUserDetail() async {
    FirebaseFirestore.instance
        .collection("users_social")
        .where("id", isEqualTo: uid)
        .snapshots()
        .listen((value) {
      setState(() {
        user = userModel.fromDocument(value.docs.first.data());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          const DashBoard(),
          atWatchScreen(required, uid: uid),
          messsageSocialScreen(required, uid: uid),
          atNotificationScreen(required, uid: uid),
          atProfileScreen(required, ownerId: uid)
        ],
        controller: _tabController,
        //onPageChanged: whenPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 56,
        width: 375 + 24,
        child: ClipRRect(
          child: Container(
            color: Colors.white,
            child: TabBar(
              labelColor: primaryColor,
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                    // icon: SvgPicture.asset(
                    //   nbDashboard,
                    //   height: 24, width: 24
                    // )
                    icon: Icon(Iconsax.global, size: 24)),
                Tab(
                    // icon: SvgPicture.asset(
                    //   nbIncidentReport,
                    //   height: 24, width: 24
                    // )
                    icon: Icon(Iconsax.video_play, size: 24)),
                Tab(
                    // icon: SvgPicture.asset(
                    //   nbIncidentReport,
                    //   height: 24, width: 24
                    // )
                    icon: Icon(Iconsax.message, size: 24)),
                    Tab(
                    // icon: SvgPicture.asset(
                    //   nbIncidentReport,
                    //   height: 24, width: 24
                    // )
                    icon: Icon(Iconsax.notification, size: 24)),
                Tab(
                  // icon: SvgPicture.asset(
                  //   nbIncidentReport,
                  //   height: 24, width: 24
                  // )
                  icon: Icon(Iconsax.profile_circle, size: 24)),                 
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}