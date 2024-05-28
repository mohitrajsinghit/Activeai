import 'package:activeai/view/Main_Tab_Page/AI/ai_upgrade_view.dart';
import 'package:activeai/view/Main_Tab_Page/Diet/diet_view.dart';
import 'package:activeai/view/Main_Tab_Page/Home/home_view.dart';
import 'package:activeai/view/Main_Tab_Page/Profile/profile_view.dart';
import 'package:activeai/view/Main_Tab_Page/Workout/workout_view.dart';
import 'package:flutter/material.dart';
import 'package:activeai/common_widget/tab_button.dart';


class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _activeTabIndex = 0;
  PageController _pageController = PageController();

  void _onTabSelected(int index) {
    setState(() {
      _activeTabIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeView(),
          WorkoutView(),
          AiUpgradeView(),
          DietView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: SafeArea(
          child: Container(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(
                  icon: "assets/img/home.png",
                  label: "Home",
                  isActive: _activeTabIndex == 0,
                  onTap: () => _onTabSelected(0),
                ),
                TabButton(
                  icon: "assets/img/workout.png",
                  label: "Workout",
                  isActive: _activeTabIndex == 1,
                  onTap: () => _onTabSelected(1),
                ),
                TabButton(
                  icon: "assets/img/ai.png",
                  label: "AI",
                  isActive: _activeTabIndex == 2,
                  onTap: () => _onTabSelected(2),
                ),
                TabButton(
                  icon: "assets/img/diet.png",
                  label: "Diet",
                  isActive: _activeTabIndex == 3,
                  onTap: () => _onTabSelected(3),
                ),
                TabButton(
                  icon: "assets/img/profile.png",
                  label: "Profile",
                  isActive: _activeTabIndex == 4,
                  onTap: () => _onTabSelected(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
