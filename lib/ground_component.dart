import 'package:flame/components.dart';
import 'package:flame_game/core/styles/app_images.dart';

class GroundComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(AppImages.groundComponentImage);
    size = Vector2(gameRef.size.x, 100);
    y = gameRef.size.y - 100;
  }
}