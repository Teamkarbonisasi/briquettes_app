import 'package:bricket_app/shared/enum.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:flutter/material.dart';

class AlertCustom extends StatefulWidget {
  final DialogType type;
  final String description;

  const AlertCustom({
    super.key,
    required this.type,
    this.description = "",
  });

  String renderTitle() {
    if (type == DialogType.success) {
      return "SUCCESS";
    }

    if (type == DialogType.warning) {
      return "WARNING";
    }

    return "";
  }

  Color renderColor() {
    if (type == DialogType.success) {
      return Colors.green;
    }

    if (type == DialogType.warning) {
      return Colors.red;
    }

    if (type == DialogType.info) {
      return primaryColor;
    }

    return Colors.white;
  }

  Color renderBackgroundColor() {
    if (type == DialogType.success) {
      return Colors.greenAccent;
    }

    if (type == DialogType.warning) {
      return Colors.redAccent;
    }

    if (type == DialogType.info) {
      return secondaryColor;
    }

    return Colors.white;
  }

  IconData renderIcon() {
    if (type == DialogType.success) {
      return Icons.check_circle_outline;
    }

    if (type == DialogType.warning) {
      return Icons.error_outline;
    }

    if (type == DialogType.info) {
      return Icons.info_outline;
    }

    return Icons.error;
  }

  @override
  State<AlertCustom> createState() => _AlertCustomState();
}

class _AlertCustomState extends State<AlertCustom> {
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
                          color:
                              widget.renderBackgroundColor().withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.renderIcon(),
                          size: 48.0,
                          color: widget.renderColor(),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        widget.renderTitle(),
                        style: const TextStyle(
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
                  ElevatedButtonCustom(
                    text: "Kembali",
                    color: widget.renderColor(),
                    borderRadius: BorderRadius.circular(5),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
