import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_gate.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://etqzmlqwhiwtdzjhnbqw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0cXptbHF3aGl3dGR6amhuYnF3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjYzMTMxMzcsImV4cCI6MjA4MTg4OTEzN30.W8l9ogGLlztE5PXuljmR8x36inJIhYqK7EUJequ5DN0',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
