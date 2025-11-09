import 'package:flutter/material.dart';

import 'core/characters_data.dart';
class CharacterPresenterWidget extends StatelessWidget {
  const CharacterPresenterWidget({super.key,required this.characterIndex});
final int characterIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text(
          'Choose Your Character',
          style: const TextStyle(
            decoration: TextDecoration.none,
            color: Color(0xffB6ED93),

            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'editundo',
          ),
        ),
        SizedBox(height: 50,),
        Text(
          characters[characterIndex].name,
          style: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'editundo',
          ),
        ),
        Image.asset(characters[characterIndex].img,width: 300,height: 200,),
        Text(
          characters[characterIndex].quote,
          style: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'editundo',
          ),
        ),
      ],
    );
  }
}
