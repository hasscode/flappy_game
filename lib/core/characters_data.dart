import 'package:flame_game/core/styles/app_images.dart';

import 'character_model.dart';

final List<CharacterModel> characters = [
  CharacterModel(
    name: 'Flappy Bird',
    img: AppImages.birdImage,
    gamePlayimg: AppImages.birdComponentImage,
    quote: "I Am The Original",
  ),
  CharacterModel(
    name: 'Blue Bird',
    img: AppImages.blueBirdImage,
    gamePlayimg: AppImages.blueBirdComponentImage,
    quote: "I Am Blue",
  ),
  CharacterModel(
    name: 'Joker',
    img: AppImages.jokerImage,
    gamePlayimg: AppImages.jokerComponentImage,
    quote: "Why So Serious?!",
  ),
  CharacterModel(
    name: 'Pizza Slice',
    img: AppImages.pizzaImage,
    gamePlayimg: AppImages.pizzaComponentImage,
    quote: "Not just a Pizza , I Am Italian ",
  ),
  CharacterModel(
    name: 'Sky',
    img: AppImages.skyImage,
    gamePlayimg: AppImages.skyComponentImage,
    quote: "Hi , I am Sky",
  ),
];