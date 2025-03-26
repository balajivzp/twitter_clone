// custom_drawer.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/provider/profile_provider.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the profile data from Riverpod provider
    final profile = ref.watch(profileProvider);

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status bar padding
          SizedBox(height: MediaQuery.of(context).padding.top),

          // Profile Header Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30, // Adjust size of avatar here
                  backgroundImage: AssetImage(profile.profileImageUrl),
                ),
                const SizedBox(height: 10),
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '@${profile.username}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${profile.following}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(' Following'),
                    const SizedBox(width: 20),
                    Text(
                      '${profile.followers}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(' Followers'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // Drawer Menu Options
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_outline),
            title: const Text('Premium'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_border),
            title: const Text('Bookmarks'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('Lists'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.mic_none_outlined),
            title: const Text('Spaces'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on_outlined),
            title: const Text('Monetisation'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),

          // Settings & Support Expansion Tile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ExpansionTile(
              title: const Text('Settings & Support'),
              collapsedIconColor: Colors.white,
              children: [
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Settings and privacy'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to Settings and Privacy
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Help Center'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to Help Center
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
