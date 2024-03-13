import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Failure'),
      ),
      body: const Center(
        child: Text(
          'Registration failed',
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}