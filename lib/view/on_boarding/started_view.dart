import 'package:activeai/view/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class StartedView extends StatefulWidget {
  const StartedView({Key? key}) : super(key: key);

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                width: media.width,
                height: media.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 270,
                      height: 200,
                      child: Image.asset(
                        "assets/img/1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      'Active AI',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        fontSize: 51,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
