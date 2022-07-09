import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yippiechat/screens/auth_screen.dart';
import './screens/chat_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.pink),
              ),
            ),
          ),
        ),
        // buttonTheme: const ButtonThemeData(
        //   buttonColor: Colors.pink,
        //   textTheme: ButtonTextTheme.primary,
        // ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.deepPurple,
          background: Colors.pink,
          brightness: Brightness.light,
        ),
      ),
      home: const AuthScreen(),
    ),
  );
}
