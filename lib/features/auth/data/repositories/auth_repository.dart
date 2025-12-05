import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:bravoo_app/core/config/supabase_config.dart';

class AuthRepository {
  SupabaseClient? get _supabase => SupabaseConfig.isConfigured ? Supabase.instance.client : null;

  User? get currentUser => _supabase?.auth.currentUser;
  bool get isLoggedIn => currentUser != null;
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    if (_supabase == null) {
      throw Exception('Supabase is not configured');
    }
    try {
      final response = await _supabase!.auth.signUp(
        email: email,
        password: password,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    if (_supabase == null) {
      throw Exception('Supabase is not configured');
    }
    try {
      final response = await _supabase!.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signInWithGoogle() async {
    if (_supabase == null) {
      throw Exception('Supabase is not configured');
    }
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: 'YOUR_GOOGLE_CLIENT_ID',
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google Sign In cancelled');
      }

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        throw Exception('Failed to get Google tokens');
      }

      final response = await _supabase!.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signInWithApple() async {
    if (_supabase == null) {
      throw Exception('Supabase is not configured');
    }
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        throw Exception('Failed to get Apple ID token');
      }

      final response = await _supabase!.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword({required String email}) async {
    if (_supabase == null) {
      throw Exception('Supabase is not configured');
    }
    try {
      await _supabase!.auth.resetPasswordForEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    if (_supabase == null) {
      throw Exception('Supabase is not configured');
    }
    try {
      await _supabase!.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Stream<AuthState> get authStateChanges {
    if (_supabase == null) {
      return Stream.error(Exception('Supabase is not configured'));
    }
    return _supabase!.auth.onAuthStateChange;
  }
}
