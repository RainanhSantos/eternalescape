import 'package:bonfire/bonfire.dart';

class PunchingSkillSpritite {
  static Future<SpriteAnimation> _sequenceImage(String fileName) {
    return SpriteAnimation.load(
      'abilities/$fileName',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.15,
        textureSize: Vector2(16, 16),
        texturePosition: Vector2(0, 0),
      ),
    );
  }

  static Future<SpriteAnimation> get atack =>
      _sequenceImage('atack_effect_right.png');
}