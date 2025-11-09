import 'package:flame_game/core/character_model.dart';
import 'package:flame_game/core/styles/app_images.dart';
import 'package:flutter/material.dart';
class CharacterItemWidget extends StatelessWidget {
  const CharacterItemWidget({super.key,required this.characterModel,required this.isSelected});
final CharacterModel characterModel;
  final  bool isSelected ;
@override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
      border: Border.all(color: isSelected?Colors.red: Colors.grey,width: 4.5)
      ),
      child: Image.asset(characterModel.img,width: 50,height: 50,),
    );
  }
}
