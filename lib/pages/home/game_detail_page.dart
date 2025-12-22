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
  final userIdController = TextEditingController();
  final packageService = PackageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.gameName)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: userIdController,
              decoration: InputDecoration(
                labelText: 'User ID Game',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text('Pilih Paket', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: packageService.getPackagesByGame(widget.gameId),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final packages = snapshot.data as List;

                  return ListView.builder(
                    itemCount: packages.length,
                    itemBuilder: (context, index) {
                      final pkg = packages[index];
                      return Card(
                        child: ListTile(
                          title: Text(pkg['name']),
                          subtitle: Text('Rp ${pkg['price']}'),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
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
            )
          ],
        ),
      ),
    );
  }
}
