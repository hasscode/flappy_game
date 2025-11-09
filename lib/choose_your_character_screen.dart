import 'package:flame/game.dart';
import 'package:flame_game/character_item_widget.dart';
import 'package:flame_game/character_presenter_widget.dart';
import 'package:flame_game/core/character_model.dart';
import 'package:flame_game/core/styles/app_images.dart';
import 'package:flutter/material.dart';

import 'core/characters_data.dart';
import 'flappy_game.dart';

class ChooseYourCharacterScreen extends StatefulWidget {
  const ChooseYourCharacterScreen({super.key});

  @override
  State<ChooseYourCharacterScreen> createState() =>
      _ChooseYourCharacterScreenState();
}

class _ChooseYourCharacterScreenState extends State<ChooseYourCharacterScreen> {
  int characterIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundBlurImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            CharacterPresenterWidget(characterIndex: characterIndex),
            Spacer(),
            SizedBox(
              height: 250,
              width: 330,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: 5,
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    setState(() {
                      characterIndex = i;
                    });
                  },
                  child: CharacterItemWidget(
                    characterModel: characters[i],
                    isSelected: characterIndex == i,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameWidget(
                      game: MyFlappyGame(characterImg: characters[characterIndex].gamePlayimg),
                      overlayBuilderMap: MyFlappyGame.overlaysMap,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 10,
                ),
                child: Text(
                  'Start',
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'editundo',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
