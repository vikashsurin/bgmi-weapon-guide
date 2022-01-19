import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:bgmi_weapon/models/attachment.dart';

//importing widgets;
import '../widgets/modified_stats.dart';

class Attachment extends StatefulWidget {
  final String activeWeaponType;
  final String activeWeapon;
  final int activeAttachmentType;
  final int activeWeaponIndex;
  const Attachment(
      {required this.activeWeaponType,
      required this.activeWeapon,
      required this.activeAttachmentType,
      required this.activeWeaponIndex,
      Key? key})
      : super(key: key);
  @override
  State<Attachment> createState() => _AttachmentState();
}

Function eq = const ListEquality().equals;

class _AttachmentState extends State<Attachment> {
  bool muzzleStatus = false;
  bool sightStatus = false;
  bool magStatus = false;
  bool gripStatus = false;
  bool stockStatus = false;

  List activeMuzzle = [0, 0];
  List activeSight = [0, 0];
  List activeMag = [0, 0];
  List activeGrip = [0, 0];
  List activeStock = [0, 0];

  bool active = false;
  int previous = -1;

  List activeAttachment = [0, 0];

  int powerIncrease = 0;
  int stabilityIncrease = 0;

  int muzzlePowerIncrease = 0;
  int muzzleRangeIncrease = 0;
  int muzzleStabilityIncrease = 0;

  int sightRangeIncrease = 0;

  int stockStabilityIncrease = 0;

  int magRateOfFireIncrease = 0;
  int magCapacityIncrease = 0;

  int gripRangeIncrease = 0;
  int gripStabilityIncrease = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      width: 1000.0,
      child: Column(
        children: [
          SizedBox(
            height: 60.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    setState(
                      () {
                        activeAttachment = [widget.activeAttachmentType, i];
                        switch (widget.activeAttachmentType) {
                          case 0:
                            activeMuzzle = [widget.activeAttachmentType, i];
                            previous == i
                                ? muzzleStatus = !muzzleStatus
                                : muzzleStatus = muzzleStatus;
                            muzzleStat(i, muzzleStatus);
                            break;
                          case 1:
                            activeSight = [widget.activeAttachmentType, i];
                            previous == i
                                ? sightStatus = !sightStatus
                                : sightStatus = !sightStatus;
                            sightStat(i, sightStatus);
                            break;
                          case 2:
                            activeMag = [widget.activeAttachmentType, i];
                            previous == i
                                ? magStatus = !magStatus
                                : magStatus = !magStatus;
                            magStat(i, magStatus);
                            break;
                          case 3:
                            activeGrip = [widget.activeAttachmentType, i];
                            previous == i
                                ? gripStatus = !gripStatus
                                : gripStatus = !gripStatus;
                            foregripStat(i, gripStatus);
                            break;
                          case 4:
                            activeStock = [widget.activeAttachmentType, i];
                            previous == i
                                ? stockStatus = !stockStatus
                                : stockStatus = !stockStatus;
                            stockStat(i, stockStatus);
                            break;
                          default:
                        }
                        previous = i;
                      },
                    );
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: eq(activeMuzzle,
                                      [widget.activeAttachmentType, i]) &&
                                  muzzleStatus ||
                              eq(activeSight,
                                      [widget.activeAttachmentType, i]) &&
                                  sightStatus ||
                              eq(activeMag, [widget.activeAttachmentType, i]) &&
                                  magStatus ||
                              eq(activeGrip,
                                      [widget.activeAttachmentType, i]) &&
                                  gripStatus ||
                              eq(activeStock,
                                      [widget.activeAttachmentType, i]) &&
                                  stockStatus
                          ? Border.all(width: 10.0, color: Colors.red)
                          : null,
                    ),
                    child: Image.asset(
                      'assets/images/${at[widget.activeWeaponType]![widget.activeWeapon]!.entries.elementAt(widget.activeAttachmentType).value.entries.elementAt(i).key}.png',
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset('assets/images/loading.png');
                      },
                      alignment: Alignment.centerRight,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10.0,
                );
              },
              itemCount: at[widget.activeWeaponType]![widget.activeWeapon]!
                  .entries
                  .elementAt(widget.activeAttachmentType)
                  .value
                  .entries
                  .length,
            ),
          ),
          ModifiedStats(
            activeWeaponIndex: widget.activeWeaponIndex,
            activeWeaponType: widget.activeWeaponType,
            muzzlePoweIncrease: muzzlePowerIncrease,
            muzzleRangeIncrease: muzzlePowerIncrease,
            muzzleStabilityIncrease: muzzleStabilityIncrease,
            sightRangeIncrease: sightRangeIncrease,
            stockStabilityIncrease: stockStabilityIncrease,
            magRateOfFireIncrease: magRateOfFireIncrease,
            magCapacityIncrease: magCapacityIncrease,
            gripRangeIncrease: gripRangeIncrease,
            gripStabilityIncrease: gripStabilityIncrease,
          ),

          // Text(wp[widget.activeWeaponType]![widget.activeWeaponIndex]
          //     .power
          //     .toString()),
          // Text(
          //     "Power :  ${wp[widget.activeWeaponType]![widget.activeWeaponIndex].power.toString()} +  ${muzzlePowerIncrease.toString()}"),
          // Text(
          //     "Range : ${muzzleRangeIncrease.toInt() + sightRangeIncrease.toInt() + gripRangeIncrease.toInt()}"),
          // Text("RateOfFire : ${magRateOfFireIncrease.toInt()}"),
          // Text("Capacity : ${magCapacityIncrease.toInt()}"),
          // Text(
          //     "Stability : ${muzzleStabilityIncrease.toInt() + stockStabilityIncrease.toInt() + gripStabilityIncrease.toInt()}"),
        ],
      ),
    );
  }

  muzzleStat(i, muzzleStatus) {
    !muzzleStatus
        ? muzzlePowerIncrease = 0
        : muzzlePowerIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['power']!
                .toInt();

    !muzzleStatus
        ? muzzleRangeIncrease = 0
        : muzzleRangeIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['range']!
                .toInt();
    !muzzleStatus
        ? muzzleStabilityIncrease = 0
        : muzzleStabilityIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['stability']!
                .toInt();
  }

  sightStat(i, sightstatus) {
    !sightStatus
        ? sightRangeIncrease = 0
        : sightRangeIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['range']!
                .toInt();
  }

  magStat(i, magStatus) {
    !magStatus
        ? magRateOfFireIncrease = 0
        : magRateOfFireIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['rateOfFire']!
                .toInt();
    !magStatus
        ? magCapacityIncrease = 0
        : magCapacityIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['capacity']!
                .toInt();
  }

  foregripStat(i, gripStatus) {
    !gripStatus
        ? gripRangeIncrease = 0
        : gripRangeIncrease = at[widget.activeWeaponType]![widget.activeWeapon]!
            .entries
            .elementAt(widget.activeAttachmentType)
            .value
            .entries
            .elementAt(i)
            .value['range']!
            .toInt();
    !gripStatus
        ? gripStabilityIncrease = 0
        : gripStabilityIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['stability']!
                .toInt();
  }

  stockStat(i, stockStatus) {
    !stockStatus
        ? stockStabilityIncrease = 0
        : stockStabilityIncrease =
            at[widget.activeWeaponType]![widget.activeWeapon]!
                .entries
                .elementAt(widget.activeAttachmentType)
                .value
                .entries
                .elementAt(i)
                .value['stability']!
                .toInt();
  }
}
