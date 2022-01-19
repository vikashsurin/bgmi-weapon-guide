import '../data/weapons/assault_rifle.dart';
import '../data/weapons/smg.dart';
import '../data/weapons/shotgun.dart';
import '../data/weapons/sniper.dart';
import '../data/weapons/pistol.dart';
import '../data/weapons/lmg.dart';
import '../data/weapons/dmr.dart';
import '../data/weapons/melee.dart';
import '../data/weapons/throwable.dart';

class Weapon {
  final String key;
  final String name;
  final String ammo;
  final double power;
  final double rateOfFire;
  final double range;
  final double capacity;
  final double stability;
  // @TODO for version 2.0.0
  // Implementation of attachments;
  // final List<Map<String, dynamic>> attachments;

  const Weapon({
    required this.key,
    required this.name,
    required this.ammo,
    required this.power,
    required this.rateOfFire,
    required this.range,
    required this.capacity,
    required this.stability,
    // required this.attachments,
  });
}

class Throwable {
  final String key;
  final String name;
  final double power;
  final double distance;
  final double range;

  const Throwable({
    required this.key,
    required this.name,
    required this.power,
    required this.distance,
    required this.range,
  });
}

final wp = {
  "ar": ar,
  "smg": smg,
  "shotgun": shotgun,
  'sniper': sniper,
  'dmr': dmr,
  'lmg': lmg,
  'pistol': pistol,
  'melee': melee,
};
final th = {'throwable': throwable};

//@TODO for version 2.0.0
// class ArAttachment {
//   final double power;
//   final double rateOfFire;
//   final double range;
//   final double capacity;
//   final double stability;

//   const ArAttachment({
//     required this.power,
//     required this.rateOfFire,
//     required this.range,
//     required this.capacity,
//     required this.stability,
//   });

//   barrelExtender() {
//     final double power;
//     return this.power;
//   }
// }
