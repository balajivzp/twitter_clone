import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/app_drawer.dart';
import 'package:twitter_clone/common/custom_app_bar.dart';
import 'package:twitter_clone/provider/bottom_nav_tab.dart';
import 'package:twitter_clone/screens/communities_screen.dart';
import 'package:twitter_clone/screens/home_screen.dart';
import 'package:twitter_clone/screens/inbox_screen.dart';
import 'package:twitter_clone/screens/notifications_screen.dart';
import 'package:twitter_clone/screens/post_screen.dart';
import 'package:twitter_clone/screens/search_screen.dart';

class BottomNavController extends StateNotifier<BottomNavTab> {
  BottomNavController() : super(BottomNavTab.home);

  void updateTab(BottomNavTab tab) {
    state = tab;
  }
}

final bottomNavProvider =
    StateNotifierProvider<BottomNavController, BottomNavTab>(
  (ref) => BottomNavController(),
);

class MainScreen extends ConsumerWidget {
  final Widget child;

  const MainScreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(bottomNavProvider);

    void onItemTapped(int index) {
      final tab = BottomNavTab.values[index];
      ref.read(bottomNavProvider.notifier).updateTab(tab);
    }

    final screens = [
      HomeScreen(),
      const SearchScreen(),
      const PostScreen(),
      const NotificationsScreen(),
      const CommunitiesScreen(),
      const InboxScreen(),
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: BottomNavTab.values.indexOf(currentTab),
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: BottomNavTab.values.indexOf(currentTab),
        onTap: onItemTapped,
        items: BottomNavTab.values.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(tab.icon),
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }
}
