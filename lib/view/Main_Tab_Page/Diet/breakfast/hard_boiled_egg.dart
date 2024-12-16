import 'package:activeai/common_widget/round_button_back.dart';
import 'package:flutter/material.dart';

class HardBoiledEgg extends StatefulWidget {
  const HardBoiledEgg({Key? key}) : super(key: key);

  @override
  State<HardBoiledEgg> createState() => _HardBoiledEggState();
}

class _HardBoiledEggState extends State<HardBoiledEgg> {
  late Size media;

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;

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
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
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
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Breakfast',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 394,
                    height: 242,
                    child: Image.asset(
                      'assets/img/hbe1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hard Boiled Eggs',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '🔥 280 kcal',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBox('Protein\n15g'),
                    _buildBox('Fat\n10g'),
                    _buildBox('Carbs\n36g'),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/img/caret-right.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    const Text(
                      '2 Eggs',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Directions',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Step-1',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Boil the two eggs in 500ml of water for\n10mins',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Step-2',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Add a pinch of salt to the boiling water',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Step-3',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'After 10mins Cool the boiling water to\nroom temperature',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Step-4',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Peel the hard shell of eggs, cut them\ninto slices',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Step-5',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                const Text(
                  'Enjoy your breakfast',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: media.width * 0.08),
                Container(
                  height: 63,
                  width: 360,
                  child: RoundButtonBack(
                    title: "Completed",
                    onPressed: null,
                  ),
                ),
                SizedBox(height: media.width * 0.04),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(String text) {
    return Container(
      width: 90,
      height: 58,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
