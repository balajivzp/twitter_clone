import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/model/post_model.dart';
import 'package:twitter_clone/provider/main_screen.dart';
import 'package:twitter_clone/screens/inbox_screen.dart';
import 'package:twitter_clone/screens/post_detail_screen.dart';

import 'screens/communities_screen.dart';
import 'screens/home_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/post_screen.dart';
import 'screens/search_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        // Home Route with Nested Child
        GoRoute(
          path: '/home',
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'postDetail', // Nested under /home
              builder: (context, state) {
                final post = state.extra as Post;
                return PostDetailScreen(post: post);
              },
            ),
          ],
        ),

        // Other Bottom Navigation Routes
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/post',
          builder: (context, state) => const PostScreen(),
        ),
        GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: '/communities',
          builder: (context, state) => const CommunitiesScreen(),
        ),
        GoRoute(
          path: '/inbox',
          builder: (context, state) => const InboxScreen(),
        ),
      ],
    ),
  ],
);
