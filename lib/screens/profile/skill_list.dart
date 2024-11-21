import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills
        .where((skill) => skill.vocation == widget.character.vocation)
        .toList();

    selectedSkill = widget.character.skills.isEmpty
        ? availableSkills.first
        : widget.character.skills.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.secondaryColor.withOpacity(.3),
          child: Column(
            children: [
              const StyledHeadline('Choose an active skill'),
              const StyledText('Skills are unique to your vocation'),
              const SizedBox(height: 20),
              // GridView.builder(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 4, // 4 items per row
              //     crossAxisSpacing: 4.0, // Spacing between columns
              //     mainAxisSpacing: 4.0, // Spacing between rows
              //   ),
              //   itemCount: availableSkills.length,
              //   itemBuilder: (context, index) {
              //     final skill = availableSkills[index];
              //     return Padding(
              //       padding: const EdgeInsets.all(4.0),
              //       child: Image.asset(
              //         'assets/images/skills/${skill.image}',
              //         width: 70,
              //         // fit: BoxFit.cover,
              //       ),
              //     );
              //   },
              // ),
              Row(
                children: availableSkills.map((skill) {
                  return Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      color: skill == selectedSkill
                          ? AppColors.primaryAccent
                          : Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSkill = skill;
                            widget.character.updateSkill(skill);
                          });
                        },
                        child: Image.asset(
                          'assets/images/skills/${skill.image}',
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              StyledHeadline(selectedSkill.name),
              StyledText(
                selectedSkill.description,
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
