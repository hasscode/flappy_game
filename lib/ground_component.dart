import 'package:flame/components.dart';

class GroundComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('ground.png');
    size = Vector2(gameRef.size.x, 100);
    y = gameRef.size.y - 100;
  }
}