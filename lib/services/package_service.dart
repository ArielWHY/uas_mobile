import '../core/supabase_client.dart';

class PackageService {
  final _client = SupabaseClientManager.client;

  Future<List<dynamic>> getPackagesByGame(String gameId) async {
    final data = await _client
        .from('topup_packages')
        .select()
        .eq('game_id', gameId)
        .eq('is_active', true);

    return data;
  }
}
