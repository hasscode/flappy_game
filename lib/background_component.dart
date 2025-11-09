import 'package:flame/components.dart';
import 'package:flame_game/core/styles/app_images.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(AppImages.backgroundComponentImage);
    size = gameRef.size;
  }
}