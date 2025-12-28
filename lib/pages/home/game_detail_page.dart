import 'package:flutter/material.dart';
import '../../services/package_service.dart';
import '../transaction/checkout_page.dart';

class GameDetailPage extends StatefulWidget {
  final String gameId;
  final String gameName;

  const GameDetailPage({
    super.key,
    required this.gameId,
    required this.gameName,
  });

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  final TextEditingController userIdController = TextEditingController();
  final PackageService packageService = PackageService();

  @override
  void dispose() {
    userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gameName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID Game',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Pilih Paket',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: packageService.getPackagesByGame(widget.gameId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Paket tidak tersedia'),
                    );
                  }

                  final packages = snapshot.data!;

                  return ListView.builder(
                    itemCount: packages.length,
                    itemBuilder: (context, index) {
                      final pkg = packages[index];

                      return Card(
                        child: ListTile(
                          title: Text(pkg['name']),
                          subtitle: Text('Rp ${pkg['price']}'),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            if (userIdController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User ID Game wajib diisi'),
                                ),
                              );
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CheckoutPage(
                                  gameId: widget.gameId,
                                  packageId: pkg['id'],
                                  gameUserId: userIdController.text,
                                  packageName: pkg['name'],
                                  price: pkg['price'],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
