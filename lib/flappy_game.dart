import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'background_component.dart';
import 'game_over_screen.dart';
import 'ground_component.dart';
import 'bird_component.dart';
import 'pipe_component.dart';

class MyFlappyGame extends FlameGame with HasCollisionDetection, TapDetector {
  late BirdComponent bird;
  double pipeSpawnTimer = 0;
  double pipeSpawnInterval = 2.5;
  int score = 0;
  late TextComponent scoreText;


  @override
  Future<void> onLoad() async {
    await add(BackgroundComponent());
    await add(GroundComponent());

    bird = BirdComponent();
    await add(bird);

    scoreText = TextComponent(
      text: 'Score: 0',
      position: Vector2(20, 20),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(scoreText);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // 🕒 توليد الأنابيب كل فترة
    pipeSpawnTimer += dt;
    if (pipeSpawnTimer > pipeSpawnInterval) {
      pipeSpawnTimer = 0;
      final newPipe = PipeComponent();
      newPipe.speed = 150 + (score ~/ 5) * 10;
      add(newPipe);
      print('add = ${newPipe.speed}');
    }

    // 🧮 حساب النقاط لما الطائر يعدي الأنبوب
    for (var comp in children.whereType<PipeComponent>()) {
      if (!comp.isPassed && bird.x > comp.bottomPipe.x + comp.bottomPipe.width) {
        comp.isPassed = true;
        score++;
        scoreText.text = 'Score: $score';
      }

    }
  }

  @override
  void onTap() {
    bird.velocity = bird.jumpForce;
  }


  static Map<String, Widget Function(BuildContext, MyFlappyGame)> get overlaysMap => {
    'GameOver': (context, game) => GameOverOverlay(game: game),
  };
}
