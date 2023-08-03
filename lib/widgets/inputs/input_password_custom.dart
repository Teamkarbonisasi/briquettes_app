import 'package:flutter/material.dart';

class InputPasswordCustom extends StatefulWidget {
  final String? hintText;
  final Color? backgroundColor;
  final String? initialValue;
  final bool disabled;
  final Color? textColor;
  final String label;
  final bool usingLabel;
  final Function(String value) onChanged;

  const InputPasswordCustom({
    super.key,
    this.hintText,
    required this.onChanged,
    this.backgroundColor,
    this.initialValue,
    this.disabled = false,
    this.textColor,
    this.label = "",
    this.usingLabel = false,
  });

  @override
  State<InputPasswordCustom> createState() => _InputPasswordCustomState();
}

class _InputPasswordCustomState extends State<InputPasswordCustom> {
  bool _visibility = false;

  Widget renderIcon() {
    return _visibility
        ? const Icon(
            Icons.visibility_off_outlined,
            size: 24,
            color: Colors.black87,
          )
        : const Icon(
            Icons.visibility_outlined,
            size: 24,
            color: Colors.black87,
          );
  }

  void changeVisibility() {
    setState(() => _visibility = !_visibility);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: renderIcon(),
          onPressed: changeVisibility,
        ),
        fillColor: widget.backgroundColor,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      enabled: !widget.disabled,
      initialValue: widget.initialValue,
      obscureText: !_visibility,
      style: TextStyle(color: widget.textColor),
      onChanged: widget.onChanged,
    );
  }
}
