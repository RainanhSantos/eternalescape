
import 'package:bonfire/bonfire.dart';
import 'package:eternalescape/controllers/goblin_generator_controller.dart';
import 'package:eternalescape/starter.dart';
import 'package:flutter/material.dart';

double tileSize = 32;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BonfireInjector.instance.put((i) => GoblinGeneratorController());
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Starter(),
    );
  }
}
