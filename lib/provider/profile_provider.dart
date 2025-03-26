// providers/profile_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/model/profile_model.dart';

// Define a provider for the profile data
final profileProvider = Provider<Profile>((ref) {
  return Profile(
    name: 'Balaji',
    username: 'balajivzp',
    profileImageUrl: 'assets/profile.png', // Local path to profile image
    followers: 120,
    following: 75,
  );
});
