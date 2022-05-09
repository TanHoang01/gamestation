import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamestation/constants.dart';
import 'package:gamestation/firebase_options.dart';
import 'package:gamestation/screens/admin_home/home_screen.dart';
import 'package:gamestation/screens/sign_in/sign_in_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GameStation',
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.blue,
          fontFamily: "Roboto",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.black54),
          ),
        ),
        home: HomeScreen());
  }
}
