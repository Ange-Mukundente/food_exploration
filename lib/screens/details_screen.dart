import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            recipe['image'] ?? 'assets/images/placeholder.png',
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('assets/images/placeholder.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              recipe['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}