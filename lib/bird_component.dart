import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart'; // مهمة لـ TapCallbacks

class BirdComponent extends SpriteComponent
    with CollisionCallbacks, HasGameRef {
  double gravity = 600;
  double jumpForce = -300;
  double velocity = 0;

  @override
  Future<void> onLoad() async {
    // تحميل صورة الطائر
    sprite = await gameRef.loadSprite('bird.png');
    size = Vector2(60, 45);
    position = Vector2(gameRef.size.x / 4, gameRef.size.y / 2);

    // إضافة hitbox للتصادم
    add(RectangleHitbox());

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
      gameRef.overlays.add('GameOver');

      position = Vector2(gameRef.size.x / 4, gameRef.size.y / 2);
      velocity = 0;
    }
  }

}
