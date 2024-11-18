import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/vocation.dart';

void main() {
  group('Character', () {
    late Character character;
    late Skill skill;
    late Skill anotherSkill;
    late Vocation vocation;

    setUp(() {
      vocation = Vocation.protector;
      skill = allSkills.firstWhere((skill) => skill.vocation == vocation);
      anotherSkill =
          allSkills.where((skill) => skill.vocation == vocation).elementAt(1);
      character = Character(
        name: 'Hero',
        slogan: 'For the glory!',
        vocation: vocation,
        id: '1',
      );
    });

    test('should initialize with given values', () {
      expect(character.name, 'Hero');
      expect(character.slogan, 'For the glory!');
      expect(character.vocation, vocation);
      expect(character.id, '1');
      expect(character.skills, isEmpty);
      expect(character.isFavorite, isFalse);
    });

    test('should toggle favorite status', () {
      expect(character.isFavorite, isFalse);
      character.toggleFavorite();
      expect(character.isFavorite, isTrue);
      character.toggleFavorite();
      expect(character.isFavorite, isFalse);
    });

    test('should update skills', () {
      character.updateSkill(skill);
      expect(character.skills, contains(skill));
      character.updateSkill(anotherSkill);
      expect(character.skills, contains(anotherSkill));
      expect(character.skills.length, 2);
    });
  });
}
