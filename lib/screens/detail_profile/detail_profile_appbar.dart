import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/appbar/leading_custom.dart';
import 'package:bricket_app/widgets/buttons/text_button_custom.dart';
import 'package:flutter/material.dart';

class DetailProfileAppbar extends StatelessWidget {
  final bool isEdit;
  final Function() onEdit;
  final Function() onSave;

  const DetailProfileAppbar({
    super.key,
    required this.isEdit,
    required this.onEdit,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: const LeadingCustom(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Profil\nSaya",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 30),
          Image.asset(
            "assets/images/image_detail-profile.png",
            width: 60.0,
          )
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: isEdit
                ? [
                    Row(
                      children: [
                        const Icon(
                          Icons.save,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 8),
                        TextButtonCustom(
                          text: "simpan",
                          fontColor: Colors.white,
                          onPressed: onSave,
                        ),
                      ],
                    ),
                  ]
                : [
                    Row(
                      children: [
                        const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 8),
                        TextButtonCustom(
                          text: "edit",
                          fontColor: Colors.white,
                          onPressed: onEdit,
                        ),
                      ],
                    ),
                  ],
          ),
        )
      ],
    );
  }
}
