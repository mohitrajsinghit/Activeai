import 'package:activeai/common_widget/custom_button.dart';
import 'package:activeai/view/Main_Tab_Page/Profile/payment.dart';
import 'package:flutter/material.dart';

class UpgradePlanView extends StatefulWidget {
  const UpgradePlanView({super.key});

  @override
  State<UpgradePlanView> createState() => _UpgradePlanViewState();
}

class _UpgradePlanViewState extends State<UpgradePlanView> {
  late Size media;

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
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
          'Upgrade Plan',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 1.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/profile_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            width: 73.01,
            height: 178.5,
            left: media.width / 2 - 73.01 / 2,
            top: 30,
            child: Image.asset(
              "assets/img/premium-quality-coin.png",
              width: 113,
              height: 113,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 180,
            child: GestureDetector(
              onTap: () => _showPlanDetails(context, media),
              child: Container(
                height: 160,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "12",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "MONTHS",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Basic",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "\$ 90.00",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      "(\$ 7.50/mo)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 90,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 20),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Premium",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "\$ 120.00",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      "(\$ 10.00/mo)",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 360,
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "6",
                            style: TextStyle(
                              color: Color.fromARGB(255, 121, 221, 154),
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "MONTHS",
                            style: TextStyle(
                              color: Color.fromARGB(255, 121, 221, 154),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Basic",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$ 45.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    "(\$ 7.50/mo)",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 90,
                                width: 1,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Premium",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$ 65.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    "(\$ 10.83/mo)",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 540,
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "1",
                            style: TextStyle(
                              color: Color.fromARGB(255, 61, 121, 210),
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "MONTHS",
                            style: TextStyle(
                              color: Color.fromARGB(255, 61, 121, 210),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Basic",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$ 20.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    "(\$ 20.0/mo)",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 90,
                                width: 1,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Premium",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "\$ 40.00",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    "(\$ 40.0/mo)",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPlanDetails(BuildContext context, Size media) {
    String _selectedPlan = '';

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF141414),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "12 Months",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPlan = 'Basic';
                          });
                        },
                        child: Container(
                          width: 175,
                          height: 157,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: _selectedPlan == 'Basic'
                                ? Colors.white
                                : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: media.width * 0.01,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Text(
                                    "Basic",
                                    style: TextStyle(
                                      color: _selectedPlan == 'Basic'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.width * 0.04),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/no_tick.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Access to Individual",
                                    style: TextStyle(
                                      color: _selectedPlan == 'Basic'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.width * 0.04),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/cross.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Access to Group of 5",
                                    style: TextStyle(
                                      color: _selectedPlan == 'Basic'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPlan = 'Premium';
                          });
                        },
                        child: Container(
                          width: 175,
                          height: 157,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: _selectedPlan == 'Premium'
                                ? Colors.white
                                : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: media.width * 0.01),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Text(
                                    "Premium",
                                    style: TextStyle(
                                      color: _selectedPlan == 'Premium'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.width * 0.04),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/no_tick.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Access to Individual",
                                    style: TextStyle(
                                      color: _selectedPlan == 'Premium'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.width * 0.04),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/img/no_tick.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Access to Group of 5",
                                    style: TextStyle(
                                      color: _selectedPlan == 'Premium'
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "* Choose your plan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RoundButton(
                    title: "Upgrade",
                    height: 60,
                    width: 360,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Payment(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
