import 'package:bonfire/bonfire.dart';
import 'package:eternalescape/abilities/punching_skill_spritite.dart';
import 'package:eternalescape/player/knight_sprite.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class KnightPlayer extends SimplePlayer with ObjectCollision, UseBarLife {
  KnightPlayer()
  : super(
    position: Vector2(
      tileSize * 5,
      tileSize * 5,
    ),
    size: Vector2(
      tileSize,
      tileSize,
    ),
    animation: SimpleDirectionAnimation(
      idleRight: KnightSprite.idleRight,
      runRight: KnightSprite.runRight,
      idleLeft: KnightSprite.idleLeft,
      runLeft: KnightSprite.runLeft,
    ),
  ) {
    setupCollision(
      CollisionConfig(
        collisions: [
            CollisionArea.rectangle(
              size: Vector2(20, 20),
              align: Vector2(6, 15),
            ),
          ],
        ),
      );
      setupBarLife(
        showLifeText: false,
        borderRadius: BorderRadius.circular(2),
        borderWidth: 2,
      );
    } 

  @override
  void joystickAction(JoystickActionEvent event) {
    if (hasGameRef && !gameRef.camera.isMoving) {
      if (event.event == ActionEvent.DOWN && event.id == 1) {
        simpleAttackMelee(
          damage: 10,
          size: Vector2(40, 40),
          animationRight: PunchingSkillSpritite.atack,
          direction: lastDirection,
        );
      }
    }
  }

  @override
  void die() async {
    removeFromParent();
    final sprite = await KnightSprite.die;
    gameRef.add(
      GameDecoration.withSprite(
        sprite: sprite.getSprite(),
        position: Vector2(
          position.x,
          position.y,
        ),
        size: Vector2.all(30),
      ),
    );
    super.die();
  }
}