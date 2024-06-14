// exercise_detail_page.dart
import 'package:flutter/material.dart';

class ExerciseDetailPage extends StatelessWidget {
  final String exerciseName;
  final String imagePath;

  const ExerciseDetailPage({
    Key? key,
    required this.exerciseName,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exerciseName),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 200, height: 200),
            SizedBox(height: 20),
            Text(
              exerciseName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
