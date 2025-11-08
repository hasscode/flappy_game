import 'package:flame/game.dart';
import 'package:flame_game/flappy_game.dart';
import 'package:flutter/material.dart';

import 'core/score_shared_preference.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.cover)

        ),
      child: Column(
children: [
  SizedBox(height: 150,),
  Text('Flappy Game Clone',style: TextStyle(fontFamily: 'editundo', fontWeight: FontWeight.w900,fontSize: 37,color: Colors.white),),
  SizedBox(height: 50,),
  FutureBuilder<int>(
    future: ScoreManager.getBestScore(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator(color: Colors.white);
      } else {
        final bestScore = snapshot.data ?? 0;
        return Text(
          'Best Score: $bestScore',
          style: const TextStyle(fontFamily: 'editundo', fontWeight: FontWeight.w900,fontSize: 22,color: Colors.white),
        );
      }
    },
  ),
  SizedBox(height: 50,),
  Container(
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: Colors.white
),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameWidget(
                game: MyFlappyGame(),
                overlayBuilderMap: MyFlappyGame.overlaysMap,
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.greenAccent,
          size: 60,
        ),
      ))

],
      ),
      ),
    );
  }
}
