import '../core/supabase_client.dart';

class AuthService {
  Future<void> signInWithEmail(String email, String password) async {
    final res = await SupabaseClientManager.client.auth
        .signInWithPassword(email: email, password: password);

    if (res.user == null) {
      throw Exception('Email atau password salah');
    }
  }

  String? get currentUserEmail {
    return SupabaseClientManager.client.auth.currentUser?.email;
  }

  Future<void> signOut() async {
    await SupabaseClientManager.client.auth.signOut();
  }
}
