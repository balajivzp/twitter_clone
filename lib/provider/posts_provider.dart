// providers/posts_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/model/post_model.dart';

final postsProvider = Provider<List<Post>>((ref) {
  return [
    Post(
      profileAvatar: 'assets/user1.png',
      time: '2h',
      userId: '@user1',
      postContent: 'This is a dummy post for "For You".',
      postImage: 'assets/post_image1.png',
    ),
    Post(
      profileAvatar: 'assets/user2.png',
      time: '3h',
      userId: '@user2',
      postContent: 'This is another dummy post with an image.',
      postImage: 'assets/post_image2.png',
    ),
    Post(
      profileAvatar: 'assets/user3.png',
      time: '5h',
      userId: '@user3',
      postContent: 'Just a text-only post for testing purposes.',
    ),
  ];
});

final followingPostsProvider = Provider<List<Post>>((ref) {
  return [
    Post(
      profileAvatar: 'assets/user4.png',
      time: '1h',
      userId: '@user4',
      postContent: 'Following tab content starts here.',
      postImage: 'assets/post_image3.png',
    ),
    Post(
      profileAvatar: 'assets/user5.png',
      time: '4h',
      userId: '@user5',
      postContent: 'More dummy content for the Following tab.',
    ),
  ];
});
