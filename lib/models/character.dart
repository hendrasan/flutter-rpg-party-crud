import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // fields
  final String name;
  final String slogan;
  final Vocation vocation;
  final String id;
  final Set<Skill> skills = {};
  bool _isFavorite = false;

  // getters
  bool get isFavorite => _isFavorite;

  // methods
  void toggleFavorite() {
    _isFavorite = !_isFavorite;
  }

  void updateSkill(Skill skill) {
    // only allow 1 skill
    skills.clear();
    skills.add(skill);
  }

  // character to firestore (map)
  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFavorite': _isFavorite,
      'vocation': vocation.name,
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': statsasMap,
      'points': points,
    };
  }

  // character from firestore
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    // get data from firestore
    final data = snapshot.data()!;

    // make character instance
    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      id: snapshot.id,
      vocation: Vocation.values
          .firstWhere((vocation) => vocation.name == data['vocation']),
    );

    // update skills
    for (String skillId in data['skills']) {
      Skill skill = allSkills.firstWhere((skill) => skill.id == skillId);
      character.updateSkill(skill);
    }

    // set isFavorite
    // character._isFavorite = data['isFavorite'];
    if (data['isFavorite'] == true) {
      character.toggleFavorite();
    }

    // assign stats and points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}

// dummy characters data

List<Character> characters = [
  Character(
    id: '1',
    name: 'Luca',
    slogan: 'I am the best!',
    vocation: Vocation.protector,
  ),
  Character(
    id: '2',
    name: 'Luna',
    slogan: 'I want everyone to be happy!',
    vocation: Vocation.medic,
  ),
  Character(
    id: '3',
    name: 'Shin',
    slogan: 'My blade will sunder the darkness!',
    vocation: Vocation.ronin,
  ),
  Character(
    id: '4',
    name: 'Kai',
    slogan: 'I\'ve been waiting for this!',
    vocation: Vocation.highlander,
  ),
];
