import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final String imageUrl;

  const PostPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
