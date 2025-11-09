import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_game/core/score_shared_preference.dart';
import 'package:flame_game/core/styles/app_images.dart';

import 'flappy_game.dart'; // مهمة لـ TapCallbacks

class CharacterComponent extends SpriteComponent
    with CollisionCallbacks, HasGameRef {
  CharacterComponent({required this.characterImg});
  final String characterImg;
  double gravity = 600;
  double jumpForce = -300;
  double velocity = 0;

  @override
  Future<void> onLoad() async {

    // تحميل صورة الطائر
    sprite = await gameRef.loadSprite(characterImg);
    size = Vector2(60, 45);
    position = Vector2(gameRef.size.x / 4, gameRef.size.y / 2);

    // إضافة hitbox للتصادم
    add(CircleHitbox(radius: size.x / 3));


  }

  @override
  void update(double dt) {
    super.update(dt);

    // تطبيق الجاذبية
    velocity += gravity * dt;
    y += velocity * dt;

    // منع السقوط أسفل الأرض
    if (y + height > gameRef.size.y - 100) {
      y = gameRef.size.y - 100 - height;
      velocity = 0;
    }

    // منع الطائر من الخروج من أعلى الشاشة
    if (y < 0) {
      y = 0;
      velocity = 0;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is SpriteComponent) {
      final myGame = gameRef as MyFlappyGame; // ✅ نحوله لنوع لعبتك
      gameRef.pauseEngine();
       ScoreManager.saveBestScore(myGame.score);
      gameRef.overlays.add('GameOver');

      position = Vector2(gameRef.size.x / 4, gameRef.size.y / 2);
      velocity = 0;
    }
  }

}
