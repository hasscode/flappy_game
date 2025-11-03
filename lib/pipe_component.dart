import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

class PipeComponent extends PositionComponent with HasGameRef, CollisionCallbacks {
  late SpriteComponent topPipe;
  late SpriteComponent bottomPipe;
  final Random random = Random();
  bool isPassed = false;
  double gap = 220;
  double speed = 150;

  @override
  Future<void> onLoad() async {
    final screenHeight = gameRef.size.y;


    final centerY = random.nextDouble() * (screenHeight - 400) + 200;


    topPipe = SpriteComponent()
      ..sprite = await gameRef.loadSprite('pipe-up.png')
      ..size = Vector2(80, 400)
      ..position = Vector2(gameRef.size.x, centerY - gap / 2 - 400)
      ..anchor = Anchor.topLeft
      ..add(RectangleHitbox());

    // ✅ الأنبوب السفلي (يطلع من تحت)
    bottomPipe = SpriteComponent()
      ..sprite = await gameRef.loadSprite('pipe-down.png')
      ..size = Vector2(80, 400)
      ..position = Vector2(gameRef.size.x, centerY + gap / 2)
      ..anchor = Anchor.topLeft
    ..add(RectangleHitbox());
    

    addAll([topPipe, bottomPipe]);


  }

  @override
  void update(double dt) {
    super.update(dt);

    // تحريك الأنابيب لليسار
    topPipe.x -= speed * dt;
    bottomPipe.x -= speed * dt;

    // حذف الأنبوب لما يخرج من الشاشة
    if (bottomPipe.x + bottomPipe.width < 0) {
      removeFromParent();
    }
  }
}
