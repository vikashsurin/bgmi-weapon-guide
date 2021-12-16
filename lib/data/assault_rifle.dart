import '../models/weapon.dart';

final List<Weapon> ar = [
  const Weapon(
    key: 'm416',
    name: 'M416',
    ammo: '5.56mm',
    power: 41,
    rateOfFire: 75,
    range: 56,
    capacity: 30,
    stability: 63,
  ),
  const Weapon(
    key: 'akm',
    name: 'Akm',
    ammo: '7.62mm',
    power: 48,
    rateOfFire: 61,
    range: 60,
    capacity: 30,
    stability: 61,
  ),
  const Weapon(
    key: 'scar-l',
    name: 'Scar-l',
    ammo: '5.56mm',
    power: 41,
    rateOfFire: 69,
    range: 55,
    capacity: 30,
    stability: 63,
  ),
  const Weapon(
    key: 'qbz',
    name: 'Qbz',
    ammo: '5.56mm',
    power: 41,
    rateOfFire: 56,
    range: 56,
    capacity: 30,
    stability: 63,
  ),
  const Weapon(
    key: 'm16a4',
    name: 'M16a4',
    ammo: '5.56mm',
    power: 41,
    rateOfFire: 15,
    range: 63,
    capacity: 30,
    stability: 61,
  ),
  const Weapon(
    key: 'mk47',
    name: 'Mk47 mutant',
    ammo: '7.62mm',
    power: 48,
    rateOfFire: 50,
    range: 63,
    capacity: 20,
    stability: 58,
  ),
  const Weapon(
    key: 'aug',
    name: 'Aug a3',
    ammo: '5.56mm',
    power: 41,
    rateOfFire: 58,
    range: 56,
    capacity: 30,
    stability: 64,
  ),
  const Weapon(
    key: 'g36c',
    name: 'G36c',
    ammo: '5.56mm',
    power: 41,
    rateOfFire: 56,
    range: 55,
    capacity: 30,
    stability: 64,
  ),
  const Weapon(
    key: 'm762',
    name: 'M762',
    ammo: '7.62mm',
    power: 46,
    rateOfFire: 66,
    range: 60,
    capacity: 30,
    stability: 61,
  ),
  const Weapon(
    key: 'groza',
    name: 'Groza',
    ammo: '7.62mm',
    power: 45,
    rateOfFire: 67,
    range: 60,
    capacity: 30,
    stability: 63,
  ),
  const Weapon(
    key: 'famas',
    name: 'Famas',
    ammo: '5.56mm',
    power: 38,
    rateOfFire: 49,
    range: 55,
    capacity: 35,
    stability: 67,
  ),
  const Weapon(
    key: 'akm-xt',
    name: 'Akm-xt',
    ammo: '7.62mm',
    power: 48,
    rateOfFire: 61,
    range: 60,
    capacity: 30,
    stability: 70,
  ),
  const Weapon(
    key: 'scar-xt',
    name: 'Scar-xt',
    ammo: '5.56mm',
    power: 44,
    rateOfFire: 69,
    range: 55,
    capacity: 30,
    stability: 66,
  ),
  const Weapon(
    key: 'm762-xt',
    name: 'm762-xt',
    ammo: '7.62mm',
    power: 46,
    rateOfFire: 66,
    range: 60,
    capacity: 30,
    stability: 64,
  ),
];


// @TODO for version 2.0.0
// attachments: [
//         {
//           'muzzle': <Map<String, dynamic>>[
//             {
//               'compensator': ArAttachment(
//                   power: 20,
//                   rateOfFire: 20,
//                   range: 20,
//                   capacity: 20,
//                   stability: 20),
//               'hollo': 'sdfdsf',
//             }
//           ]
//         },
//         {
//           'sight': [
//             'red dot',
//             '2x',
//           ]
//         },
//         {
//           'mag': {'extended', 'extended-quickdraw', 'quickdraw'}
//         },
//         {
//           'foregrip': {'light', 'vertical'}
//         }
//       ],