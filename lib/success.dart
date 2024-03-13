import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: const Center(
        child: Text(
          'Registration successfully',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
