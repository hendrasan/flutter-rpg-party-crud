import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/screens/profile/heart.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // basic info - image, vocation, description
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withOpacity(.3),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: character.id.toString(),
                        child: Image.asset(
                          'assets/images/vocations/${character.vocation.image}',
                          // width: 140,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                      // const SizedBox(width: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyledHeadline(character.name),
                              StyledText(character.vocation.description),
                              // StyledText("\"${character.slogan}\""),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 8,
                  child: Heart(character: character),
                ),
              ],
            ),

            // weapon and ability
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeadline('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeadline('Weapon of Choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeadline('Unique Skill'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),

            // save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(context, listen: false)
                    .saveCharacter(character);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const StyledHeadline('Character saved!'),
                    showCloseIcon: true,
                    duration: const Duration(seconds: 2),
                    backgroundColor: AppColors.secondaryColor,
                    // behavior: SnackBarBehavior.floating,
                    // margin: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                );
              },
              child: const StyledHeadline('Save Character'),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
