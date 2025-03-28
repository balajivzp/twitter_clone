// providers/posts_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/model/post_model.dart';

final postsProvider =
    StateNotifierProvider<PostsNotifier, AsyncValue<List<Post>>>((ref) {
  return PostsNotifier();
});

final followingPostsProvider =
    StateNotifierProvider<FollowingPostsNotifier, AsyncValue<List<Post>>>(
        (ref) {
  return FollowingPostsNotifier();
});

class PostsNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  PostsNotifier() : super(const AsyncValue.loading());

  Future<void> getPosts() async {
    try {
      state = const AsyncValue.loading();
      await Future.delayed(
          const Duration(seconds: 2)); // Simulate network delay
      state = AsyncValue.data([
        Post(
          profileAvatar: 'assets/flutter.png',
          time: '30m',
          userId: '@flutterdev',
          postContent:
              'Flutter 3.29 is out now! Exciting new features and performance improvements. 🚀 #Flutter #MobileDev',
          postImage: 'assets/flutter_3_29.jpeg',
        ),
        Post(
          profileAvatar: 'assets/user2.png',
          time: '1h',
          userId: '@devdaily',
          postImage: 'assets/flutter_state_management.jpg',
          postContent:
              'Struggling with state management in Flutter? Provider vs Riverpod – which one do you prefer? 🤔 #FlutterDev',
        ),
        Post(
          profileAvatar: 'assets/dev_daily.png',
          time: '2h',
          userId: '@openaispace',
          postContent:
              'ChatGPT just got even better! Now with improved reasoning and multi-modal capabilities. #AI #MachineLearning',
          postImage: 'assets/chatGPT_release.jpg',
        ),
        Post(
            profileAvatar: 'assets/cybernews_logo.jpeg',
            time: '3h',
            userId: '@cybernews',
            postContent:
                '🚨 New cybersecurity threat detected! Stay safe and update your passwords. #CyberSecurity #TechNews',
            postImage: 'assets/cyber_threat.png'),
        Post(
          profileAvatar: 'assets/ux_logo.png',
          time: '5h',
          userId: '@uxdesigners',
          postContent:
              'Dark mode or light mode? Which one do you prefer for UI/UX design? 🎨 #UIDesign #UserExperience',
          postImage: 'assets/theme_mode.png',
        ),
        Post(
          profileAvatar: 'assets/startup_logo.png',
          time: '7h',
          userId: '@startupworld',
          postImage: 'assets/startup_world_idea.jpg',
          postContent:
              'A small idea can turn into a million-dollar business! Keep innovating. 💡 #Entrepreneurship #Startups',
        ),
        Post(
          profileAvatar: 'assets/gadget_zone_logo.jpeg',
          time: '8h',
          userId: '@gadgetzone',
          postContent:
              'iPhone 16 leaks suggest some exciting changes! What’s on your wishlist? 📱 #Apple #TechLeaks',
          postImage: 'assets/iphone16.jpeg',
        ),
        Post(
          profileAvatar: 'assets/fitnesworld_logo.png',
          time: '9h',
          userId: '@fitnessdaily',
          postImage: 'assets/workout_image.jpeg',
          postContent:
              'Consistency is key! A 30-minute workout every day can change your life. 💪 #Fitness #HealthyLiving',
        ),
        Post(
          profileAvatar: 'assets/travellife_logo.png',
          time: '12h',
          userId: '@travellife',
          postContent:
              'Just visited the beautiful beaches of Bali! 🌴✨ #Travel #Wanderlust',
          postImage: 'assets/bali.webp',
        ),
        Post(
          profileAvatar: 'assets/spacegeeks_logo.png',
          time: '15h',
          userId: '@spacegeek',
          postImage: 'assets/nasa.webp',
          postContent:
              'NASA just discovered a new exoplanet! The universe is full of wonders. 🌌 #Space #Astronomy',
        ),
      ]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

class FollowingPostsNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  FollowingPostsNotifier() : super(const AsyncValue.loading());

  Future<void> getPosts() async {
    try {
      state = const AsyncValue.loading();
      await Future.delayed(
          const Duration(seconds: 2)); // Simulate network delay
      state = AsyncValue.data([
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
      ]);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
