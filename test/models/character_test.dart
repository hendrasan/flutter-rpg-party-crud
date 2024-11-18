import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rpg/models/character.dart';

void main() {
  group('Character', () {
    test('should toggle favorite status', () {
      // Arrange
      final character =
          Character(name: 'Hero', slogan: 'To the rescue!', id: '1');

      // Act
      character.toggleFavorite();
      // Assert
      expect(character.isFavorite, true);

      // Act
      character.toggleFavorite();
      // Assert
      expect(character.isFavorite, false);
    });
  });
}
