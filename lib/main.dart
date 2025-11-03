import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'flappy_game.dart';



void main() {
  runApp(GameWidget(
      overlayBuilderMap: MyFlappyGame.overlaysMap,
      game: MyFlappyGame()));
}
