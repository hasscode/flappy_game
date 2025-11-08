import 'package:flame/components.dart';
import 'package:flame_game/core/score_shared_preference.dart';
import 'package:flame_game/pipe_component.dart';
import 'package:flame_game/start_screen.dart';
import 'package:flutter/material.dart';
import 'flappy_game.dart';

class GameOverOverlay extends StatelessWidget {
  final MyFlappyGame game;

  const GameOverOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        color: Colors.black.withOpacity(0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'GAME OVER ',
              style: TextStyle( decoration: TextDecoration.none,color: Colors.redAccent, fontSize: 52, fontWeight: FontWeight.bold,fontFamily: 'editundo'),
            ),
            const SizedBox(height: 40),
            Text(game.scoreText.text,style: TextStyle( decoration: TextDecoration.none,color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold ,fontFamily: 'editundo'),),
            const SizedBox(height: 20),
            FutureBuilder<int>(
              future: ScoreManager.getBestScore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(color: Colors.white);
                } else {
                  final bestScore = snapshot.data ?? 0;
                  return Text(

                    'Best Score: $bestScore',
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.pinkAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'editundo'
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: IconButton(
                      onPressed: () {

                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>(StartScreen())));
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.black,
                        size: 45,
                      ),
                    )),
                SizedBox(width: 40,),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: IconButton(
                      onPressed: () {
                        game.overlays.remove('GameOver'); // 🔹 اخفي overlay
                        game.resumeEngine(); // 🔹 شغل اللعبة تاني

                        // ✅ رجّع كل حاجة للوضع الأول
                        game.score = 0;
                        game.scoreText.text = 'Score: 0';
                        game.bird.position = Vector2(game.size.x / 4, game.size.y / 2);
                        game.bird.velocity = 0;

                        // 🧹 امسح كل الأنابيب القديمة
                        game.children.whereType<PipeComponent>().forEach((pipe) {
                          pipe.removeFromParent();
                        });
                      },
                      icon: const Icon(
                        Icons.refresh_rounded,
                        color: Colors.brown,
                        size: 45,

                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
