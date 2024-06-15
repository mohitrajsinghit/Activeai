import 'package:activeai/view/Main_Tab_Page/Diet/breakfast/hard_boiled_egg.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DietView extends StatefulWidget {
  const DietView({Key? key}) : super(key: key);

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView> {
  late Size media;
  late DateTime _currentDate;

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
          'Diet',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
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
                    height: media.width * 0.07,
                  ),
                  _buildSection(
                    title: 'Breakfast',
                    items: [
                      _buildDietItem('assets/img/hbe.png', 'Hard Boiled Eggs',
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HardBoiledEgg()),
                        );
                      }),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/ps.png', 'Protein Smoothie'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/om.png', 'Oatmeal'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/fs.png', 'Fruit Salad'),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                  _buildSection(
                    title: 'Lunch',
                    items: [
                      _buildDietItem('assets/img/sandwich.png', 'Sandwich'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/vrb.png', 'Veggie Rice Bowl'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/veggies.png', 'Veggies'),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                  _buildSection(
                    title: 'Snacks',
                    items: [
                      _buildDietItem('assets/img/fruits.png', 'Fruits'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem(
                          'assets/img/a_w_c.png', 'Almonds/walnuts/cashews'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/ps.png', 'Protein Smoothie'),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.5,
                  ),
                  _buildSection(
                    title: 'Dinner',
                    items: [
                      _buildDietItem('assets/img/rc.png', 'Roasted Chicken'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/gb.png', 'Grain bowls'),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      _buildDietItem('assets/img/cs.png', 'Chicken Soup'),
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
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: media.width * 0.03,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
        SizedBox(height: media.width * 0.07),
      ],
    );
  }

  Widget _buildDietItem(String imagePath, String itemName,
      {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 20),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 90,
              height: 90,
            ),
            SizedBox(width: 30.5), // Added SizedBox for spacing
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
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
