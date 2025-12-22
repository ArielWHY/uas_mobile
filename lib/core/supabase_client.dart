import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientManager {
  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://etqzmlqwhiwtdzjhnbqw.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0cXptbHF3aGl3dGR6amhuYnF3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYzMTMxMzcsImV4cCI6MjA4MTg4OTEzN30.W8l9ogGLlztE5PXuljmR8x36inJIhYqK7EUJequ5DN0',
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
