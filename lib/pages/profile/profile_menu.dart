import 'package:flutter/material.dart';
import '../auth/login_page.dart';

class ProfileMenu extends StatelessWidget {
  final String username;

  const ProfileMenu({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      icon: const CircleAvatar(
        radius: 16,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.person, color: Colors.white, size: 18),
      ),
      onSelected: (value) {
        if (value == 'logout') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (_) => false,
          );
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: Text(
            username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const PopupMenuDivider(),

        const PopupMenuItem(
          value: 'home',
          child: Text('Beranda'),
        ),
        const PopupMenuItem(
          value: 'setting',
          child: Text('Setting'),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'logout',
          child: Text(
            'Logout',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
