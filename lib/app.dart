import 'package:flutter/material.dart';
import 'package:hand_cricket/screens/select_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hand Cricket',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Color(0xff607C3C),
              foregroundColor: Colors.white,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                backgroundColor: const Color(0xff607C3C),
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: const TextStyle(
                color: Color(0xff607C3C),
              ),
              filled: true,
              fillColor: const Color(0xffECECA3),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(
                    color: Color(0xffECECA3),
                  ))),
          scaffoldBackgroundColor: const Color(0xffABC32F)),
      home: SelectScreen(),
    );
  }
}
