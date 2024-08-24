import 'package:flutter/material.dart';
import 'package:oxidized/oxidized.dart';
import 'package:rick_and_morty_app/features/home_screen/data/api/character_api.dart';
import 'package:rick_and_morty_app/features/home_screen/data/models/character_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CharacterModel> list = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final respository = CharacterApi();
    final x = await respository.getList();
    if (x.isOk()) {
      list = x.unwrap();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(list.length.toString()),
      ),
    );
  }
}
