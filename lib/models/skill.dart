import 'package:flutter_rpg/models/vocation.dart';

class Skill {
  Skill({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.vocation,
  });

  final String id;
  final String name;
  final String description;
  final String image;
  final Vocation vocation;
}

final List<Skill> allSkills = [
  // protector skills
  Skill(
    id: '1',
    name: 'Defend',
    description: 'The protector defends an ally.',
    image: 'defend.png',
    vocation: Vocation.protector,
  ),
  Skill(
    id: '2',
    name: 'Taunt',
    description: 'The protector taunts an enemy.',
    image: 'taunt.png',
    vocation: Vocation.protector,
  ),
  Skill(
    id: '3',
    name: 'Shield Bash',
    description: 'The protector bashes an enemy with their shield.',
    image: 'shield_bash.png',
    vocation: Vocation.protector,
  ),
  Skill(
    id: '4',
    name: 'Shield Wall',
    description:
        'The protector raises their shield to block all incoming attacks.',
    image: 'shield_wall.png',
    vocation: Vocation.protector,
  ),

  // ronin 4 skills
  Skill(
    id: '5',
    name: 'Slash',
    description: 'The ronin slashes an enemy.',
    image: 'slash.png',
    vocation: Vocation.ronin,
  ),
  Skill(
    id: '6',
    name: 'Dash',
    description: 'The ronin dashes to an enemy.',
    image: 'dash.png',
    vocation: Vocation.ronin,
  ),
  Skill(
    id: '7',
    name: 'Double Slash',
    description: 'The ronin slashes an enemy twice.',
    image: 'double_slash.png',
    vocation: Vocation.ronin,
  ),
  Skill(
    id: '8',
    name: 'Wind Strike',
    description: 'The ronin strikes an enemy with the wind.',
    image: 'wind_strike.png',
    vocation: Vocation.ronin,
  ),

  // medic 4 skills
  Skill(
    id: '9',
    name: 'Heal',
    description: 'The medic heals an ally.',
    image: 'heal.png',
    vocation: Vocation.medic,
  ),
  Skill(
    id: '10',
    name: 'Revive',
    description: 'The medic revives a fallen ally.',
    image: 'revive.png',
    vocation: Vocation.medic,
  ),
  Skill(
    id: '11',
    name: 'Cleanse',
    description: 'The medic cleanses an ally of all debuffs.',
    image: 'cleanse.png',
    vocation: Vocation.medic,
  ),
  Skill(
    id: '12',
    name: 'Regenerate',
    description: 'The medic regenerates an ally\'s health over time.',
    image: 'regenerate.png',
    vocation: Vocation.medic,
  ),

  // highlander 4 skills
  Skill(
    id: '13',
    name: 'Cleave',
    description: 'The highlander cleaves an enemy.',
    image: 'cleave.png',
    vocation: Vocation.highlander,
  ),
  Skill(
    id: '14',
    name: 'Charge',
    description: 'The highlander charges at an enemy.',
    image: 'charge.png',
    vocation: Vocation.highlander,
  ),
  Skill(
    id: '15',
    name: 'Whirlwind',
    description: 'The highlander whirlwinds around an enemy.',
    image: 'whirlwind.png',
    vocation: Vocation.highlander,
  ),
  Skill(
    id: '16',
    name: 'Execute',
    description: 'The highlander executes an enemy.',
    image: 'execute.png',
    vocation: Vocation.highlander,
  ),
];
