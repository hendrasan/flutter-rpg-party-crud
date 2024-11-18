mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _magic = 10;
  int _speed = 10;

  // getters
  int get points => _points;
  int get health => _health;
  int get attack => _attack;
  int get defense => _defense;
  int get magic => _magic;
  int get speed => _speed;

  Map<String, int> get statsasMap => {
        'health': _health,
        'attack': _attack,
        'defense': _defense,
        'magic': _magic,
        'speed': _speed,
      };

  List<Map<String, String>> get statsAsFormattedList => [
        {'stat': 'Health', 'value': _health.toString()},
        {'stat': 'Attack', 'value': _attack.toString()},
        {'stat': 'Defense', 'value': _defense.toString()},
        {'stat': 'Magic', 'value': _magic.toString()},
        {'stat': 'Speed', 'value': _speed.toString()},
      ];

  // methods
  void increaseStat(String stat) {
    if (_points > 0) {
      switch (stat) {
        case 'health':
          _health++;
          break;
        case 'attack':
          _attack++;
          break;
        case 'defense':
          _defense++;
          break;
        case 'magic':
          _magic++;
          break;
        case 'speed':
          _speed++;
          break;

        default:
          break;
      }
    }
  }

  void decreaseStat(String stat) {
    switch (stat) {
      case 'health':
        if (_health > 1) {
          _health--;
          _points++;
        }
        break;
      case 'attack':
        if (_attack > 1) {
          _attack--;
          _points++;
        }
        break;
      case 'defense':
        if (_defense > 1) {
          _defense--;
          _points++;
        }
        break;
      case 'magic':
        if (_magic > 1) {
          _magic--;
          _points++;
        }
        break;
      case 'speed':
        if (_speed > 1) {
          _speed--;
          _points++;
        }
        break;

      default:
        break;
    }
  }
}
