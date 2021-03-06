import '../models/weapon.dart';

final List<Weapon> pistol = [
  const Weapon(
    key: 'p1911',
    name: 'P1911',
    ammo: '.45 acp',
    power: 38,
    rateOfFire: 29,
    range: 15,
    capacity: 7,
    stability: 68,
  ),
  const Weapon(
    key: 'p18c',
    name: 'P18c',
    ammo: '9mm',
    power: 22,
    rateOfFire: 68,
    range: 10,
    capacity: 17,
    stability: 72,
  ),
  const Weapon(
    key: 'sawed-off',
    name: 'Sawed-Off',
    ammo: '12 gauge',
    power: 80,
    rateOfFire: 5,
    range: 10,
    capacity: 2,
    stability: 50,
  ),
  const Weapon(
    key: 'skorpion',
    name: 'Skorpion',
    ammo: '9mm',
    power: 22,
    rateOfFire: 54,
    range: 10,
    capacity: 20,
    stability: 72,
  ),
  const Weapon(
    key: 'desert-eagle',
    name: 'Desert-Eagle',
    ammo: '.45 acp',
    power: 62,
    rateOfFire: 31,
    range: 31,
    capacity: 7,
    stability: 42,
  ),
  const Weapon(
    key: 'vz61-xt',
    name: 'Vz61-Xt',
    ammo: '9mm',
    power: 22,
    rateOfFire: 56,
    range: 11,
    capacity: 20,
    stability: 75,
  ),
];
