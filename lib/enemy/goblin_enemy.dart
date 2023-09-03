import 'package:bonfire/bonfire.dart';
import 'package:eternalescape/controllers/goblin_generator_controller.dart';
import 'package:eternalescape/main.dart';
import '../abilities/punching_skill_spritite.dart';
import 'goblin_sprite.dart';

class GoblinEnemy extends SimpleEnemy with ObjectCollision, UseStateController<GoblinGeneratorController> {
  GoblinEnemy({
    required Vector2 position,
  }) : super(
          position: position,
          size: Vector2(32, 32),
          speed: 50,
          animation: SimpleDirectionAnimation(
            idleRight: GoblinSprite.idleRight,
            idleLeft: GoblinSprite.idleLeft,
            runRight: GoblinSprite.runRight,
            runLeft: GoblinSprite.runLeft,
          ),
          life: 50,
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
  }

  @override
  void update(double dt){
    seeAndMoveToPlayer(
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      closePlayer: (Player){
        simpleAttackMelee(
          damage: 10, 
          size: Vector2(40, 40),
          animationRight: PunchingSkillSpritite.atack,
          direction: lastDirection,
          withPush: true,
        );
      },
      radiusVision: tileSize * 30,
    );
    super.update(dt);
  }

  @override
  void die() {
    controller.respawnMany();
    removeFromParent();
    super.die();
    
  }
}