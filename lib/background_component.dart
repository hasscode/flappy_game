import 'package:flame/components.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bg.png');
    size = gameRef.size;
  }
}