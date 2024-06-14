import 'package:activeai/view/Main_Tab_Page/Diet/diet_view.dart';
import 'package:activeai/view/Main_Tab_Page/Home/home_view.dart';
import 'package:activeai/view/Main_Tab_Page/Workout/workout/dumbbellInclineflyespage.dart';
import 'package:activeai/view/Main_Tab_Page/Workout/workout_view.dart';
import 'package:activeai/view/complete_profile/dob.dart';
import 'package:activeai/view/complete_profile/what_is_your_goal.dart';
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
