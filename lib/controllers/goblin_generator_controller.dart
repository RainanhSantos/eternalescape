import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:eternalescape/enemy/goblin_enemy.dart';
import 'package:eternalescape/main.dart';

class GoblinGeneratorController extends StateController<GoblinEnemy> {
  final _positionToRespawn = [
    Vector2(tileSize * 4, tileSize * 4),
    Vector2(tileSize * 16, tileSize * 4),
    Vector2(tileSize * 4, tileSize * 16),
    Vector2(tileSize * 16, tileSize * 16),
  ];
  final _quantityRespaws = 2;

  @override
  void update(double dt, component){}

  void _respawn(Vector2 position) {
    final hasGameRef = component?.hasGameRef ?? false;
    if (hasGameRef && !gameRef.camera.isMoving){
      final goblin = GoblinEnemy(position: position);
      gameRef.add(goblin);
    }
  }

  void respawnMany() {
    final random = Random();
    final positions = List<Vector2>.from(_positionToRespawn);
    int numberOfRespawn = _quantityRespaws;

    while (numberOfRespawn > 0) {
      final indexPosition = random.nextInt(positions.length);
      final position = positions[indexPosition];
      _respawn(position);
      positions.remove(position);
      numberOfRespawn -= 1;
    }
  }
}