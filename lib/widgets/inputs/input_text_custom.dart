import 'package:flutter/material.dart';

class InputTextCustom extends StatelessWidget {
  final String? hintText;
  final Function(String value) onChanged;
  final Color? backgroundColor;
  final String? initialValue;
  final bool disabled;
  final Color? textColor;
  final TextInputType? keyboardType;
  final String label;
  final bool usingLabel;

  const InputTextCustom({
    super.key,
    this.hintText,
    required this.onChanged,
    this.backgroundColor,
    this.initialValue,
    this.disabled = false,
    this.textColor,
    this.keyboardType,
    this.label = '',
    this.usingLabel = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    if (usingLabel) {
      widgets.add(Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ));
      widgets.add(const SizedBox(height: 10.0));
    }

    widgets.add(
      TextFormField(
        enabled: !disabled,
        keyboardType: keyboardType,
        autofocus: false,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
        ),
        style: TextStyle(color: textColor),
        initialValue: initialValue,
        onChanged: onChanged,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
