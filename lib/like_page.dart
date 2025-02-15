import 'package:flutter/material.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Like Page!'),
      ),
    );
  }
}