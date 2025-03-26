import 'package:flutter/material.dart';

enum BottomNavTab { home, search, post, communities, notifications, inbox }

extension BottomNavTabExtension on BottomNavTab {
  String get label {
    switch (this) {
      case BottomNavTab.home:
        return 'Home';
      case BottomNavTab.search:
        return 'Search';
      case BottomNavTab.post:
        return 'Post';
      case BottomNavTab.notifications:
        return 'Notifications';
      case BottomNavTab.communities:
        return 'Communities';
      case BottomNavTab.inbox:
        return 'Inbox';
    }
  }

  IconData get icon {
    switch (this) {
      case BottomNavTab.home:
        return Icons.home;
      case BottomNavTab.search:
        return Icons.search;
      case BottomNavTab.post:
        return Icons.post_add;
      case BottomNavTab.notifications:
        return Icons.notifications;
      case BottomNavTab.communities:
        return Icons.groups;
      case BottomNavTab.inbox:
        return Icons.inbox;
    }
  }
}
