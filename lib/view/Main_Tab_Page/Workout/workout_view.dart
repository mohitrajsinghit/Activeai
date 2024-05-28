import 'package:flutter/material.dart';
import 'dart:async';

class WorkoutView extends StatefulWidget {
  const WorkoutView({Key? key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  late Size media;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    // Check the date change every minute
    Timer.periodic(Duration(minutes: 1), (timer) {
      DateTime now = DateTime.now();
      if (now.day != _currentDate.day) {
        setState(() {
          _currentDate = now;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;

    // Get the current date
    DateTime now = _currentDate;

    // Define the days of the week
    List<String> daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

    // Get the day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    int currentDayIndex = now.weekday % 7;

    // Define the dates for the current week
    List<int> dates = List.generate(7, (index) {
      return now.subtract(Duration(days: currentDayIndex - index)).day;
    });

    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Text(
          'Workout',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: daysOfWeek.map((day) {
                return Text(
                  day,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                bool isToday = index == currentDayIndex;
                return Column(
                  children: [
                    if (isToday)
                      Container(
                        margin: const EdgeInsets.only(bottom: 4.0),
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          shape: BoxShape.circle,
                        ),
                      ),
                    Text(
                      dates[index].toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (isToday)
                      Container(
                        margin: const EdgeInsets.only(top: 4.0),
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
