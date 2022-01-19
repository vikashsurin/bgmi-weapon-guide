import 'package:bgmi_weapon/widgets/attachment.dart';
import 'package:flutter/material.dart';
import '../models/attachment.dart';
import './attachment.dart';

class AttachmentList extends StatefulWidget {
  final String activeWeaponType;
  final String activeWeapon;
  final int activeWeaponIndex;

  const AttachmentList({
    required this.activeWeaponType,
    required this.activeWeapon,
    required this.activeWeaponIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<AttachmentList> createState() => _AttachmentListState();
}

class _AttachmentListState extends State<AttachmentList> {
  var activeAttachmentType = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      alignment: Alignment.center,
      height: 500,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          // active = false;
                          activeAttachmentType = index;
                        });
                      },
                      child: Ink(
                        padding: activeAttachmentType == index
                            ? const EdgeInsets.all(10.0)
                            : const EdgeInsets.all(0.0),
                        child: Image.asset(
                          'assets/images/${at[widget.activeWeaponType]![widget.activeWeapon]!.entries.elementAt(index).key}.png',
                          errorBuilder:
                              (context, Object error, StackTrace? stackTrace) {
                            return Image.asset('assets/images/loading.png');
                          },
                          alignment: Alignment.centerRight,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                );
              },
              // separatorBuilder: (context, index) {
              //   return const SizedBox(
              //     width: 10.0,
              //   );
              // },
              itemCount:
                  at[widget.activeWeaponType]![widget.activeWeapon]!.length,
            ),
          ),
          Attachment(
              activeWeaponType: widget.activeWeaponType,
              activeWeaponIndex: widget.activeWeaponIndex,
              activeWeapon: widget.activeWeapon,
              activeAttachmentType: activeAttachmentType),
        ],
      ),
    );
  }
}
