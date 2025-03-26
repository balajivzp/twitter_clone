// providers/profile_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/model/profile_model.dart';

// Define a class to hold both profile and loading state
class ProfileState {
  final Profile profile;
  final bool isLoading;

  ProfileState({required this.profile, this.isLoading = false});

  ProfileState copyWith({Profile? profile, bool? isLoading}) {
    return ProfileState(
      profile: profile ?? this.profile,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// Define a StateNotifier for managing profile state
class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier()
      : super(ProfileState(
          profile: Profile(
            name: 'Balaji',
            username: 'balajivzp',
            profileImageUrl:
                'assets/profile.png', // Local path to profile image
            followers: 120,
            following: 75,
          ),
        ));

  // Method to update the profile
  void updateProfile({
    String? name,
    String? username,
    String? profileImageUrl,
    int? followers,
    int? following,
  }) async {
    // Set loading to true
    state = state.copyWith(isLoading: true);

    // Simulate a delay for async operation
    await Future.delayed(Duration(seconds: 1));

    // Update the profile and set loading to false
    state = state.copyWith(
      profile: Profile(
        name: name ?? state.profile.name,
        username: username ?? state.profile.username,
        profileImageUrl: profileImageUrl ?? state.profile.profileImageUrl,
        followers: followers ?? state.profile.followers,
        following: following ?? state.profile.following,
      ),
      isLoading: false,
    );
  }
}

// Define a provider for the ProfileNotifier
final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});
