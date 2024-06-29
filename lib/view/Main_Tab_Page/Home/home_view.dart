import 'package:flutter/material.dart';
import 'package:activeai/common/colo_extension.dart'; // Import your color extension
import 'post_page.dart'; // Import the PostPage

class Post {
  final String imageUrl;
  final String username;
  final bool isLiked;

  Post({
    required this.imageUrl,
    required this.username,
    this.isLiked = false,
  });

  Post toggleLike() {
    return Post(
      imageUrl: imageUrl,
      username: username,
      isLiked: !isLiked,
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Size media;
  late List<Post> posts;

  @override
  void initState() {
    super.initState();
    // Initialize posts with different usernames and images
    posts = [
      Post(
        imageUrl: 'assets/img/post1.png',
        username: 'michael_01',
      ),
      Post(
        imageUrl: 'assets/img/post2.png',
        username: 'amy_chin',
      ),
      Post(
        imageUrl: 'assets/img/post3.png',
        username: 'luke_mic',
      ),
      Post(
        imageUrl: 'assets/img/post4.png',
        username: 'moriss_gr',
      ),
      Post(
        imageUrl: 'assets/img/post5.png',
        username: 'victorr',
      ),
      // Add more posts as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.black, // Assuming TColor is defined in your colo_extension.dart file
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostPage(
                    imageUrl: post.imageUrl,
                  ),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          'assets/img/user_${index % 5 + 1}.png', // Change user avatar dynamically
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        post.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(post.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            post.isLiked ? Icons.favorite : Icons.favorite_border,
                            color: post.isLiked ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              posts[index] = posts[index].toggleLike();
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.mode_comment_outlined),
                          color: Colors.white,
                          onPressed: () {
                            // Handle comment action
                          },
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      color: Colors.white,
                      onPressed: () {
                        // Handle share action
                      },
                    ),
                  ],
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Comments section...', // Replace with actual comments
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      
                    },
                    child: Text(
                      'View all comments', 
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
