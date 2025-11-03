import 'package:flutter/material.dart';
import 'flappy_game.dart';

class GameOverOverlay extends StatelessWidget {
  final MyFlappyGame game;

  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '💀 GAME OVER 💀',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.overlays.remove('GameOver'); // 🔹 اخفي overlay
                game.resumeEngine(); // 🔹 رجّع التحديث
                game.score = 0;

              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
