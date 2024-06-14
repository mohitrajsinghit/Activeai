import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DumbbellInclineFlyesPage extends StatefulWidget {
  const DumbbellInclineFlyesPage({super.key});

  @override
  State<DumbbellInclineFlyesPage> createState() =>
      _DumbbellInclineFlyesPageState();
}

class _DumbbellInclineFlyesPageState extends State<DumbbellInclineFlyesPage> {
  late Size media;
  late VideoPlayerController _controller;

  List<Map<String, int>> sets = [
    {'reps': 10, 'lbs': 20}
  ]; // First set is default

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/vid/dif.mp4')
      ..initialize().then((_) {
        setState(() {}); // Update the state to reflect the video initialization
        _controller.setLooping(true); // Loop the video
        _controller.play(); // Auto-play the video
      }).catchError((error) {
        // Handle error during initialization
        print('Error initializing video: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addSet() {
    setState(() {
      sets.add({'reps': 10, 'lbs': 20}); // Default values for new sets
    });
  }

  void _removeSet(int index) {
    setState(() {
      sets.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: TColor.black,
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
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/profile_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5 -
                        kToolbarHeight,
                    width: double.maxFinite,
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(height: media.width * 0.03),
                  const Text(
                    "Dumbbell Incline Flyes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: media.width * 0.08),
                  Expanded(
                    child: ListView.builder(
                      itemCount: sets.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(50, 4, 20, 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'SET ${index + 1}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Text(
                                        '${sets[index]['reps']}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                      const Text(
                                        'REPS ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  const Text(
                                    'X',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 27),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Text(
                                        '${sets[index]['lbs']}',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                      const Text(
                                        ' LBS',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (index != 0)
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.white),
                                  onPressed: () => _removeSet(index),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: media.width * 0.08),
                  Container(
                    height: 63,
                    width: 360,
                    child: RoundButton(
                      title: "Add More Sets",
                      onPressed: _addSet,
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

enum RoundButtonType { bgGradient, bgSGradient, textGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;
  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  const RoundButton({
    Key? key,
    required this.title,
    this.type = RoundButtonType.bgGradient,
    this.fontSize = 16,
    this.elevation = 1,
    this.fontWeight = FontWeight.w700,
    required this.onPressed,
    this.height,
    this.width,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = type == RoundButtonType.bgSGradient
        ? Colors.blue // Example color
        : Colors.blue; // Example color

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 100),
        boxShadow: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0.5,
                  offset: Offset(0, 0.5),
                ),
              ]
            : null,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
        ),
        textColor: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Colors.white
            : Colors.blue,
        elevation: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? 0
            : elevation,
        color: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Colors.transparent
            : buttonColor,
        padding: padding,
        child: Text(
          title,
          style: TextStyle(
            color: type == RoundButtonType.bgGradient ||
                    type == RoundButtonType.bgSGradient
                ? Colors.white
                : Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
