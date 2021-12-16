import 'package:flutter/material.dart';
import '../models/weapon.dart';

//weapon data

class ActiveWeapon extends StatefulWidget {
  final String activeWeapon;
  final String weaponType;

  const ActiveWeapon({
    required this.activeWeapon,
    required this.weaponType,
    Key? key,
  }) : super(key: key);
  @override
  State<ActiveWeapon> createState() => _ActiveWeaponState();
}

class _ActiveWeaponState extends State<ActiveWeapon> {
  var activeWeaponIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.weaponType),
      ),
      body: Container(
        color: Colors.grey,
        child: ListView(
          children: [
            Stack(
              children: <Widget>[
                weaponImage(),
                weaponStat(),
              ],
            ),
            horizontalWeaponListScroll(),
            weaponDetail(),
          ],
        ),
      ),
    );
  }

  //  ! deprecated
  // Widget backBtn() {
  //   return const Positioned(
  //     left: 10.0,
  //     child: Icon(
  //       Icons.arrow_back,
  //       color: Colors.white,
  //       size: 50.0,
  //     ),
  //   );
  // }

  Widget weaponImage() {
    return Positioned(
      child: Container(
        decoration: const BoxDecoration(
            // color: Colors.amberAccent,
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(1, 88, 207, .6),
            Colors.grey,
          ],
          tileMode: TileMode.repeated,
        )),
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width * 1.0,
        child: Image.asset(
          'assets/images/${wp[widget.activeWeapon]![activeWeaponIndex].key}.png',
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Image.asset('assets/images/loading.png');
          },
          alignment: Alignment.centerRight,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget weaponStat() {
    return Positioned(
      left: 10,
      top: 60,
      child: SizedBox(
        // height: 300,
        height: MediaQuery.of(context).size.height * 1,
        width: 100,
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  children: [
                    Text(
                      'Ammo',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      wp[widget.activeWeapon]![activeWeaponIndex]
                          .ammo
                          .toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Text(
                      'Damage',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      wp[widget.activeWeapon]![activeWeaponIndex]
                          .power
                          .toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Text(
                      'Rate Of Fire',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      wp[widget.activeWeapon]![activeWeaponIndex]
                          .rateOfFire
                          .toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Text(
                      'Range',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      wp[widget.activeWeapon]![activeWeaponIndex]
                          .range
                          .toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Text(
                      'Stability',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      wp[widget.activeWeapon]![activeWeaponIndex]
                          .stability
                          .toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalWeaponListScroll() {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Card(
                  elevation: activeWeaponIndex == index ? 10.0 : 0.0,
                  color: activeWeaponIndex == index
                      ? Colors.amber[500]
                      : Colors.white,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      setState(() {
                        activeWeaponIndex = index;
                      });
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              wp[widget.activeWeapon]![index].name,
                              textAlign: TextAlign.center,
                              style: activeWeaponIndex == index
                                  ? const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : const TextStyle(color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10.0,
            );
          },
          itemCount: wp[widget.activeWeapon]!.length),
    );
  }

  weaponDetail() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.height * 1.0,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              wp[widget.activeWeapon]![activeWeaponIndex].name,
              style: const TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "**Coming Soon**, Short description, Attachments, Compare stats with different attachments and more... ",
              style: TextStyle(
                color: Colors.yellow,
                decoration: TextDecoration.none,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
