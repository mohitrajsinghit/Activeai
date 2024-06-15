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
            child: _buildBox(
              text: 'Upgrade Plan',
              imagePath: 'assets/img/bxs-crown.png',
            ),
          ),
          Positioned(
            right: 13,
            top: 40,
            child: _buildBox(
              text: 'Edit Profile',
              imagePath: 'assets/img/edit-text.png',
            ),
          ),
          Positioned(
            left: 13,
            right: 13, 
            top: 190, 
            child: _buildBox2(
              
              profileImage:
                  'assets/img/profile_circle_image.png', 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox({required String text, required String imagePath}) {
    return Container(
      width: 140,
      height: 31,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 130, 123, 123).withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
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
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: HalfMoonClipper(),
          child: Container(
            width: 404,
            height: 102,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 130, 123, 123).withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //content here


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
}

class HalfMoonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.addArc(Rect.fromCircle(center: Offset(size.width / 2, 0), radius: 50),
        0, -3.14);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
