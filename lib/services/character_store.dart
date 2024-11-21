import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(
      id: '1',
      name: 'Luca',
      slogan: 'I am the best!',
      vocation: Vocation.protector,
    ),
    Character(
      id: '2',
      name: 'Luna',
      slogan: 'Oh holy light, heal us!',
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

  get characters => _characters;

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }
}
