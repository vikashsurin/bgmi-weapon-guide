import 'package:flutter/material.dart';
import '../models/weapon.dart';

class ModifiedStats extends StatefulWidget {
  final int activeWeaponIndex;
  final String activeWeaponType;

  final int muzzlePoweIncrease;

  final int muzzleRangeIncrease;
  final int muzzleStabilityIncrease;

  final int sightRangeIncrease;

  final int stockStabilityIncrease;

  final int magRateOfFireIncrease;
  final int magCapacityIncrease;

  final int gripRangeIncrease;
  final int gripStabilityIncrease;

  const ModifiedStats(
      {required this.activeWeaponIndex,
      required this.activeWeaponType,
      required this.muzzlePoweIncrease,
      required this.muzzleRangeIncrease,
      required this.muzzleStabilityIncrease,
      required this.sightRangeIncrease,
      required this.stockStabilityIncrease,
      required this.magCapacityIncrease,
      required this.magRateOfFireIncrease,
      required this.gripRangeIncrease,
      required this.gripStabilityIncrease,
      Key? key})
      : super(key: key);

  @override
  State<ModifiedStats> createState() => _ModifiedStatsState();
}

class _ModifiedStatsState extends State<ModifiedStats> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Power : "),
                  Text(
                    wp[widget.activeWeaponType]![widget.activeWeaponIndex]
                        .power
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " +${widget.muzzlePoweIncrease.toString()}",
                    style: const TextStyle(
                      color: Color.fromRGBO(100, 220, 24, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Range : "),
                  Text(
                    wp[widget.activeWeaponType]![widget.activeWeaponIndex]
                        .range
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " +${widget.muzzleRangeIncrease.toInt() + widget.sightRangeIncrease.toInt() + widget.gripRangeIncrease}",
                    style: const TextStyle(
                      color: Color.fromRGBO(100, 220, 24, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("RateOfFire : "),
                  Text(
                    wp[widget.activeWeaponType]![widget.activeWeaponIndex]
                        .rateOfFire
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " +${widget.magRateOfFireIncrease.toInt()}",
                    style: const TextStyle(
                      color: Color.fromRGBO(100, 220, 24, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Capacity : '),
                  Text(
                    wp[widget.activeWeaponType]![widget.activeWeaponIndex]
                        .capacity
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " +${widget.magCapacityIncrease.toInt()}",
                    style: const TextStyle(
                      color: Color.fromRGBO(100, 220, 24, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Stability : '),
                  Text(
                    wp[widget.activeWeaponType]![widget.activeWeaponIndex]
                        .stability
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " +${widget.muzzleStabilityIncrease.toInt() + widget.stockStabilityIncrease.toInt() + widget.gripStabilityIncrease}",
                    style: const TextStyle(
                      color: Color.fromRGBO(100, 220, 24, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
