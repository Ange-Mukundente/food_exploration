import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/details_screen.dart';

void main() {
  runApp(FoodExplorerApp());
}

class FoodExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Explorer',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}