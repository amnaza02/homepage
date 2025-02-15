import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Categories Page!'),
      ),
    );
  }
}