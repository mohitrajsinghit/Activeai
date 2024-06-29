import 'package:activeai/view/Main_Tab_Page/Profile/editprofileview.dart';
import 'package:activeai/view/Main_Tab_Page/Profile/upgradeplanview.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Size media;

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/img/work_sweat_repeat.png',
              width: media.width,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 13,
            top: 40,
            child: _buildButton(
              text: 'Upgrade Plan',
              imagePath: 'assets/img/bxs-crown.png',
              onPressed: _onUpgradePlanPressed,
            ),
          ),
          Positioned(
            right: 13,
            top: 40,
            child: _buildButton(
              text: 'Edit Profile',
              imagePath: 'assets/img/edit-text.png',
              onPressed: _onEditProfilePressed,
            ),
          ),
          Positioned(
            left: 13,
            right: 13,
            top: 167,
            child: _buildBox2(
              profileImage: 'assets/img/profile_circle_image.png',
              username: 'Jackson',
              followers: '10K',
              following: '200',
              points: '0',
              pointsImage: 'assets/img/coin.png',
            ),
          ),
        ],
      ),
    );
  }

  void _onUpgradePlanPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpgradePlanView()),
    );
  }

  void _onEditProfilePressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileView()),
    );
  }

  Widget _buildButton(
      {required String text,
      required String imagePath,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        backgroundColor: Color.fromARGB(255, 130, 123, 123).withOpacity(0.9),
        shape: StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 16,
            height: 16,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBox2({
    required String profileImage,
    required String username,
    required String followers,
    required String following,
    required String points,
    required String pointsImage,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: HalfMoonClipper(),
          child: Container(
            width: media.width * 0.9,
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 130, 123, 123).withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 40),
                      child: Text(
                        username,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 27),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildStatColumn(followers, 'Followers'),
                              _buildDivider(),
                              _buildStatColumn(following, 'Following'),
                              _buildDivider(),
                              Expanded(
                                child: _buildStatWithIcon(
                                    points, 'Points', pointsImage),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: 30,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(profileImage),
          ),
        ),
      ],
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildStatWithIcon(String value, String label, String iconPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 4),
            Image.asset(
              iconPath,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
    );
  }
}

class HalfMoonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.addArc(
      Rect.fromCircle(center: Offset(size.width / 2, 0), radius: 50),
      0,
      -3.14,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
