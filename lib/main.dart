import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/screens/home.dart';

void main() {
  runApp(ProviderScope(child: TestingApp()));
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        FavoritesPage.routeName: (context) => FavoritesPage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
