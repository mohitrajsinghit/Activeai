import 'package:flutter/material.dart';
import 'package:activeai/common_widget/on_boarding_page.dart';
import 'package:activeai/view/login/login_with_mobile.dart';
import '../../common/colo_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Workout anywhere",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "image": "assets/img/2.png"
    },
    {
      "title": "Learn with AI",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "image": "assets/img/3.png"
    },
    {
      "title": "Stay strong & healthy",
      "subtitle":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      "image": "assets/img/4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return Column(
                children: [
                  Expanded(
                    child: OnBoardingPage(pObj: pObj),
                  ),
                  SizedBox(
                    height: 100,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 62),
                        child: Text(
                          index == pageArr.length - 1 ? "Get Started" : "",
                          style: TextStyle(
                            color: TColor.white,
                            fontFamily: 'Roboto',
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 50,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: pageArr.length,
                effect: WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: Colors.white,
                  activeDotColor: TColor.primaryColor1,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 118,
            child: SizedBox(
              width: 102,
              height: 102,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      color: TColor.primaryColor1,
                      value: (selectPage + 1) / pageArr.length,
                      strokeWidth: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: TColor.primaryColor1,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: TColor.white),
                      onPressed: () {
                        if (selectPage < pageArr.length - 1) {
                          selectPage = selectPage + 1;
                          controller.animateToPage(
                            selectPage,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.bounceInOut,
                          );
                          controller.jumpToPage(selectPage);
                          setState(() {});
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginWithMobile(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
