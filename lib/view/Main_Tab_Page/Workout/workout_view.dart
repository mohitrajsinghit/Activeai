import 'package:activeai/view/Main_Tab_Page/Workout/workout/dumbbellInclineflyespage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class WorkoutView extends StatefulWidget {
  const WorkoutView({Key? key}) : super(key: key);

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  late Size media;
  late DateTime _currentDate;
  bool _showWarmUpContent = true;
  bool _showWorkoutContent = false;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    Timer.periodic(const Duration(minutes: 1), (timer) {
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
    DateTime now = _currentDate;
    List<String> daysOfWeek = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    int currentDayIndex = now.weekday % 7;
    List<int> dates = List.generate(7, (index) {
      return now.subtract(Duration(days: currentDayIndex - index)).day;
    });

    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/profile_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.black.withOpacity(
                        0.7), // Semi-transparent black background for the calendar
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
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
                                decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            Text(
                              dates[index].toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              daysOfWeek[index],
                              style: const TextStyle(
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
                  ),
                  SizedBox(
                    height: media.width * 0.02,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chest & Triceps',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '48 MINS',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.07,
                  ),
                  _buildSection(
                    title: 'Warm Up',
                    duration: '13 MINS',
                    showContent: _showWarmUpContent,
                    toggleContent: () {
                      setState(() {
                        _showWarmUpContent = !_showWarmUpContent;
                        _showWorkoutContent =
                            !_showWarmUpContent; // Switch Workout state when Warm Up is toggled
                      });
                    },
                    items: [
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem('assets/img/ct.png', 'Cross Trainer'),
                      SizedBox(height: media.height * 0.035),
                      const Text(
                        'CIRCUIT SET: Follow sequence',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem('assets/img/dc.png', 'Deltoid Circles'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem('assets/img/cc.png', 'Cat Camel'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem('assets/img/kh.png', 'Kettlebell Halo'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem('assets/img/iw.png', 'Inch Worm'),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.07,
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: media.width * 0.07,
                  ),
                  _buildSection(
                    title: 'Workout',
                    duration: '33 MINS',
                    showContent: _showWorkoutContent,
                    toggleContent: () {
                      setState(() {
                        _showWorkoutContent = !_showWorkoutContent;
                        _showWarmUpContent =
                            !_showWorkoutContent; // Switch Warm Up state when Workout is toggled
                      });
                    },
                    items: [
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem(
                          'assets/img/dif.png', 'Dumbbell Incline Flyes'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem(
                          'assets/img/smbp.png', 'Smith Machine Bench press'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem(
                          'assets/img/te.png', 'Tricep Extensions'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem('assets/img/kp.png', 'Knee Pushup'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem(
                          'assets/img/mcf.png', 'Machine Chest Flyes'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem(
                          'assets/img/dte.png', 'Dumbbell Tricep Extension'),
                      SizedBox(height: media.height * 0.035),
                      _buildWarmUpItem('assets/img/pm.png', 'Plank March'),
                      SizedBox(height: media.height * 0.035),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String duration,
    required bool showContent,
    required VoidCallback toggleContent,
    required List<Widget> items,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: toggleContent,
                  child: Icon(
                    showContent
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        if (showContent)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items,
            ),
          ),
      ],
    );
  }

  Widget _buildWarmUpItem(String imagePath, String exerciseName) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: GestureDetector(
        onTap: () {
          // Navigate to the correct detail page based on exercise name
          if (exerciseName == 'Dumbbell Incline Flyes') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DumbbellInclineFlyesPage(),
              ),
            );
          } else if (exerciseName == 'Smith Machine Bench press') {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const SmithMachineBenchPressPage(),
            //   ),
            // );
          } else if (exerciseName == 'Tricep Extensions') {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const TricepExtensionsPage(),
            //   ),
            // );
          }
          // Add other conditions for different exercises
        },
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 90,
              height: 101,
            ),
            SizedBox(width: 30.5), // Added SizedBox for spacing
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exerciseName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
