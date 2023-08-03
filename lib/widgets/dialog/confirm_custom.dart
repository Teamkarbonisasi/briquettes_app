import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:bricket_app/widgets/buttons/outlined_button_custom.dart';
import 'package:flutter/material.dart';

class ConfirmCustom extends StatefulWidget {
  final String description;
  final bool loading;
  final Function() onTap;

  const ConfirmCustom({
    super.key,
    this.description = "",
    this.loading = false,
    required this.onTap,
  });

  @override
  State<ConfirmCustom> createState() => _ConfirmCustomState();
}

class _ConfirmCustomState extends State<ConfirmCustom> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Dialog.fullscreen(
      backgroundColor: Colors.black.withOpacity(0.4),
      child: Center(
        child: SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.4,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 28.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.info_outline,
                          size: 48.0,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        "CONFIRM",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.description,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButtonCustom(
                        text: "Tidak",
                        loading: widget.loading,
                        borderRadius: BorderRadius.circular(5),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 18),
                      ElevatedButtonCustom(
                        text: "Ya",
                        loading: widget.loading,
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(5),
                        onPressed: widget.onTap,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
