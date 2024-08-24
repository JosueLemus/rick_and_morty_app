import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/characters_list/presenter/screens/characters_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      home: CharactersListScreen(),
    );
  }
}
