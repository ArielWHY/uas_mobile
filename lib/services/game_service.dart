import '../core/supabase_client.dart';

class GameService {
  final _client = SupabaseClientManager.client;

  Future<List<dynamic>> getGames() async {
    final data = await _client.from('games').select();
    return data;
  }
}
