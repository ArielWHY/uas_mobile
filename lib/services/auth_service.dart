import '../core/supabase_client.dart';

class AuthService {
  final _client = SupabaseClientManager.client;

  Future<void> signInWithEmail(String email, String password) async {
    await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  bool get isLoggedIn => _client.auth.currentSession != null;
}
