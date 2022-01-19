import 'package:flutter/material.dart';
import 'package:bgmi_weapon/widgets/throwable_weapon.dart';
import 'widgets/active_weapon.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

final weapons = [
  Wt(
      name: 'Assault Rifle',
      route: '/ar',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'ar', weaponTypeHeading: 'Assault Rifle')),
  Wt(
      name: 'Smg',
      route: '/smg',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'smg', weaponTypeHeading: 'Short Machine Gun')),
  Wt(
      name: 'Shotgun',
      route: '/shotgun',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'shotgun', weaponTypeHeading: 'Shotgun')),
  Wt(
      name: 'Sniper Rifle',
      route: '/sniper',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'sniper', weaponTypeHeading: 'Sniper Rifle')),
  Wt(
      name: 'Dmr',
      route: '/dmr',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'dmr',
          weaponTypeHeading: 'Designated Marksman Rifle')),
  Wt(
      name: 'Lmg',
      route: '/lmg',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'lmg', weaponTypeHeading: 'Light Machine Gun')),
  Wt(
      name: 'Pistol',
      route: '/pistol',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'pistol', weaponTypeHeading: 'Pistol')),
  Wt(
      name: 'Melee',
      route: '/melee',
      builder: (context) => const ActiveWeapon(
          activeWeaponType: 'melee', weaponTypeHeading: 'Melee')),
  Wt(
      name: 'Throwable',
      route: '/throwable',
      builder: (context) => const ThrowableWeapon(
          activeThrow: 'throwable', weaponTypeHeading: 'Throwable')),
];

/// MYAPP...
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 112, 238, .9),
          // backgroundColor: Color.fromRGBO(1, 102, 238, 1),
        ),
      ),
      title: 'Bgmi Weapons',
      routes: Map.fromEntries(weapons.map((e) => MapEntry(e.route, e.builder))),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bgmi Weapons"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(237, 128, 1, .8),
            // Color.fromRGBO(29, 29, 29, 1),
            Colors.black,
          ],
          // tileMode: TileMode.repeated,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 10, 0),
          child: ListView(
            children: [...weapons.map((e) => Tile(wt: e))],
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final Wt? wt;

  const Tile({this.wt, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        elevation: 2,
        shadowColor: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              wt!.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, wt!.route);
      },
    );
  }
}

//weapon type
class Wt {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Wt({required this.name, required this.route, required this.builder});
}
