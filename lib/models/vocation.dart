enum Vocation {
  protector(
      title: 'Protector',
      description:
          'The protector is a tank class that can take a lot of damage.',
      image: 'assets/images/protector.png',
      weapon: 'Sword and Shield',
      ability: 'Defend'),
  ronin(
      title: 'Ronin',
      description:
          'The ronin is a damage class that moves with swift speed, but hits quite hard as well.',
      image: 'assets/images/ronin.png',
      weapon: 'Katana',
      ability: 'Slash'),
  medic(
      title: 'Medic',
      description: 'The medic is a support class that can heal allies.',
      image: 'assets/images/medic.png',
      weapon: 'Staff',
      ability: 'Heal'),
  highlander(
      title: 'Highlander',
      description:
          'The highlander is a damage class that can deal a lot of damage.',
      image: 'assets/images/highlander.png',
      weapon: 'Spear',
      ability: 'Cleave');

  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability,
  });

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
}
