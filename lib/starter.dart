import 'package:eternalescape/main.dart';
import 'package:eternalescape/player/knight_player.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';

import 'enemy/goblin_enemy.dart';



class Starter extends StatefulWidget {
  const Starter({super.key});

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
        ),
        actions: [
          JoystickAction(
          actionId: 1,
          color: Colors.orange,
          margin: const EdgeInsets.all(40),
          )
        ],
      ),
        map: WorldMapByTiled(
        'map/map.json',
        forceTileSize: Vector2(tileSize, tileSize),
      ),
      player: KnightPlayer(),
      components: [
        GoblinEnemy(position: Vector2(
          tileSize * 20,
          tileSize * 20
        )),
      ],
    );
  }
}