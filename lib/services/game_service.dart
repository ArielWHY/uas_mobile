import '../core/supabase_client.dart';

class GameService {
  Future<List<Map<String, dynamic>>> getGames() async {
    final response = await supabase.from('games').select();

    return List<Map<String, dynamic>>.from(response);
  }
}
