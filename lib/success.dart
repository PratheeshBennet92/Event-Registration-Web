import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SuccessScreen extends StatelessWidget {
 final QrImageView qrImageView;
 const SuccessScreen({Key? key, required this.qrImageView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Registration successful',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            qrImageView, // Display the QR code image
          ],
        ),
      ),
    );
  }
}
