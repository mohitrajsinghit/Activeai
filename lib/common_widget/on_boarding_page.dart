import 'package:flutter/material.dart';
import 'package:activeai/common/colo_extension.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  const OnBoardingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            pObj["image"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: media.width * 0.1),
          Text(
            pObj["title"].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColor.white,
              fontFamily: 'Roboto',
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: media.width * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Text(
              pObj["subtitle"].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TColor.white,
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
