import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../widgets/auth_gate.dart';

import '../free_fire/free_fire_page.dart';
import '../mobile_legends/mobile_legends_page.dart';
import '../pubgm/pubgm_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up Game'),
        leading: PopupMenuButton<String>(
          icon: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          onSelected: (value) async {
            if (value == 'logout') {
              await authService.signOut();

              if (!context.mounted) return;

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const AuthGate()),
                (_) => false,
              );
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              enabled: false,
              child: Text(
                authService.currentUserEmail ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 'logout',
              child: Text('Logout'),
            ),
          ],
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _GameTile(
            title: 'Free Fire',
            subtitle: 'Garena',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FreeFirePage()),
              );
            },
          ),
          _GameTile(
            title: 'Mobile Legends',
            subtitle: 'Moonton',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MobileLegendsPage()),
              );
            },
          ),
          _GameTile(
            title: 'PUBG Mobile',
            subtitle: 'Tencent Games',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PubGMPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _GameTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _GameTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
