import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckoutPage extends StatelessWidget {
  final String gameId;
  final String packageId;
  final String gameUserId;
  final String packageName;
  final int price;

  const CheckoutPage({
    super.key,
    required this.gameId,
    required this.packageId,
    required this.gameUserId,
    required this.packageName,
    required this.price,
  });

  Future<void> createTransaction(BuildContext context) async {
    final user = Supabase.instance.client.auth.currentUser;

    await Supabase.instance.client.from('transactions').insert({
      'user_id': user!.id,
      'game_id': gameId,
      'package_id': packageId,
      'game_user_id': gameUserId,
      'total_price': price,
      'status': 'pending',
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Transaksi berhasil dibuat')),
    );

    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Paket: $packageName'),
            Text('User ID: $gameUserId'),
            Text('Total: Rp $price'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => createTransaction(context),
              child: Text('Bayar'),
            )
          ],
        ),
      ),
    );
  }
}
