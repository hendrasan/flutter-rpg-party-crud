import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/profile.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => Profile(character: character)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              // Text(character),
              Hero(
                tag: character.id.toString(),
                child: Image.asset(
                  'assets/images/vocations/${character.vocation.image}',
                  width: 100,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      StyledHeadline(character.name),
                      if (character.isFavorite)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.favorite,
                              color: AppColors.primaryAccent),
                        ),
                    ],
                  ),
                  StyledText(character.vocation.title),
                  StyledText('${character.points} SP available'),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Icon(Icons.arrow_forward, color: AppColors.textColor),
            ],
          ),
        ),
      ),
    );
  }
}
