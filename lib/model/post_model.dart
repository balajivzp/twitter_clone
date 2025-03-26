// models/post.dart
class Post {
  final String profileAvatar;
  final String time;
  final String userId;
  final String postContent;
  final String? postImage;

  Post({
    required this.profileAvatar,
    required this.time,
    required this.userId,
    required this.postContent,
    this.postImage,
  });
}
