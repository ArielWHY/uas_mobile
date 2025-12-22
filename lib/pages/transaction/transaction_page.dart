import 'package:flutter/material.dart';
import '../success/success_page.dart';

class TransactionPage extends StatefulWidget {
  final String gameName;
  final String nominal;
  final String price;
  final;

  const TransactionPage({
    super.key,
    required this.gameName,
    required this.nominal,
    required this.price,
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final playerIdController = TextEditingController();
  final emailController = TextEditingController();

  String selectedPayment = 'OVO';
  bool isLoading = false;

  final paymentMethods = [
    'OVO',
    'DANA',
    'GoPay',
    'Pulsa',
    'ShopeePay',
  ];

  @override
  void dispose() {
    playerIdController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void submitTransaction() async {
    if (playerIdController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ID Player wajib diisi')),
      );
      return;
    }

    setState(() => isLoading = true);

    // simulasi proses pembayaran
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SuccessPage(
          gameName: widget.gameName,
          playerId: playerIdController.text,
          nominal: widget.nominal,
          paymentMethod: selectedPayment,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Top Up'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.gameName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('${widget.nominal} • ${widget.price}'),

            const SizedBox(height: 24),

            TextField(
              controller: playerIdController,
              decoration: const InputDecoration(
                labelText: 'ID Player',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email (Opsional)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: selectedPayment,
              decoration: const InputDecoration(
                labelText: 'Metode Pembayaran',
                border: OutlineInputBorder(),
              ),
              items: paymentMethods
                  .map(
                    (method) => DropdownMenuItem(
                      value: method,
                      child: Text(method),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => selectedPayment = value!);
              },
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: isLoading ? null : submitTransaction,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
