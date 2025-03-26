// widgets/post_item.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/model/post_model.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/home/postDetail',
            extra: post); // Navigate to detail screen
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Avatar
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(post.profileAvatar),
            ),
            const SizedBox(width: 12),
            // Post Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header (User ID and Time)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        post.userId,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post.time,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Post Text
                  Text(
                    post.postContent,
                    style: const TextStyle(fontSize: 14),
                  ),
                  // Post Image (if available)
                  if (post.postImage != null) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(post.postImage!),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
