import 'package:flame/game.dart';
import 'package:flame_game/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flappy_game.dart';


// GameWidget(
// overlayBuilderMap: MyFlappyGame.overlaysMap,
// game: MyFlappyGame())
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(FlappyGameStart());
}
class FlappyGameStart extends StatelessWidget {
  const FlappyGameStart({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}

