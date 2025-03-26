// home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/provider/posts_provider.dart';
import 'package:twitter_clone/screens/widgets/post_item.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forYouPosts = ref.watch(postsProvider);
    final followingPosts = ref.watch(followingPostsProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: const [
              Tab(text: 'For You'),
              Tab(text: 'Following'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // "For You" Tab
            ListView.builder(
              itemCount: forYouPosts.length,
              itemBuilder: (context, index) {
                return PostItem(post: forYouPosts[index]);
              },
            ),
            // "Following" Tab
            ListView.builder(
              itemCount: followingPosts.length,
              itemBuilder: (context, index) {
                return PostItem(post: followingPosts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
