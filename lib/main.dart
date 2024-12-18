import 'package:activeai/view/Main_Tab_Page/Profile/editprofileview.dart';
import 'package:activeai/view/Main_Tab_Page/Profile/upgradeplanview.dart';
import 'package:activeai/view/main_tab/main_tab_view.dart';
import 'package:activeai/view/on_boarding/started_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Active AI',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: "Roboto",
        useMaterial3: true,
      ),
      home: const StartedView(),
    );
  }
}
