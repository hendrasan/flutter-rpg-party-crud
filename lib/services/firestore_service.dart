import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService {
  static final ref =
      FirebaseFirestore.instance.collection('characters').withConverter(
            fromFirestore: Character.fromFirestore,
            toFirestore: (Character c, _) => c.toFireStore(),
          );

  // add a new character
  static Future<void> addCharacter(Character character) async {
    // without the converter above, we would have to convert the character to a map manually, like this
    // await ref.doc(character.id).set({
    // 'name': character.name,
    // 'slogan': character.slogan,
    // 'vocation': character.vocation.name,
    // 'isFavorite': character.isFavorite,
    // 'skills': character.skills.map((skill) => skill.id).toList(),
    // 'stats': character.statsasMap,
    // 'points': character.points,
    // });
    await ref.doc(character.id).set(character);
  }

  // get characters once
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  // update a character
  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsasMap,
      'points': character.points,
      'skills': character.skills.map((skill) => skill.id).toList(),
      'isFavorite': character.isFavorite,
    });
  }

  // delete a character
  static Future<void> deleteCharacter(Character character) async {
    print('deleting character ${character.id}');
    await ref.doc(character.id).delete();
  }

  // toggle favorite a character
  static Future<void> toggleFavorite(Character character) async {
    await ref.doc(character.id).update({
      'isFavorite': !character.isFavorite,
    });
  }
}
