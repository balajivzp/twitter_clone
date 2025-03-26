import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/common/app_drawer.dart';
import 'package:twitter_clone/common/custom_app_bar.dart';
import 'package:twitter_clone/provider/bottom_nav_tab.dart';

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

    void _onItemTapped(int index) {
      final tab = BottomNavTab.values[index];
      ref.read(bottomNavProvider.notifier).updateTab(tab);

      switch (tab) {
        case BottomNavTab.home:
          context.go('/home');
          break;
        case BottomNavTab.search:
          context.go('/search');
          break;
        case BottomNavTab.post:
          context.go('/post');
          break;
        case BottomNavTab.notifications:
          context.go('/notifications');
          break;
        case BottomNavTab.communities:
          context.go('/communities');
          break;
        case BottomNavTab.inbox:
          context.go('/inbox');
          break;
      }
    }

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: BottomNavTab.values.indexOf(currentTab),
        onTap: _onItemTapped,
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
