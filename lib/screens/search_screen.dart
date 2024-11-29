import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _recipes = [];
  final String _apiKey = '89bda0185f4c4259aa3c85e1225cb0a8';

  Future<void> _searchRecipes(String query) async {
    final url =
        'https://api.spoonacular.com/recipes/complexSearch?query=$query&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _recipes = data['results'];
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for any Food'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter a food name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _searchRecipes(_controller.text);
            },
            child: const Text('Search'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipe = _recipes[index];
                return ListTile(
                  title: Text(recipe['title']),
                  leading: Image.network(
                    recipe['image'] ?? 'assets/images/placeholder.png',
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/placeholder.png'),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/details',
                        arguments: recipe);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}