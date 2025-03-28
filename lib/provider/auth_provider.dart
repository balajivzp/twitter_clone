import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState {
  authenticated,
  unauthenticated,
  loading,
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.unauthenticated);

  void login() {
    state = AuthState.loading;
    // Simulate login process
    Future.delayed(Duration(seconds: 2), () {
      state = AuthState.authenticated;
    });
  }

  void loginWithEmail(String email) {
    state = AuthState.loading;
    // Simulate login process
    Future.delayed(Duration(seconds: 2), () {
      if (email == "test@example.com") {
        // Example validation
        state = AuthState.authenticated;
      } else {
        state = AuthState.unauthenticated;
      }
    });
  }

  void logout() {
    state = AuthState.unauthenticated;
  }
}

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
