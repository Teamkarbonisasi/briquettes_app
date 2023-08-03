import 'package:bricket_app/widgets/bottom_navigation/bottom_navigation_item.dart';
import 'package:flutter/material.dart';

class BottomNavigationCustom extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationCustom({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(color: Colors.white),
      currentIndex: currentIndex,
      onTap: (int newIndex) => onTap(newIndex),
      items: bottomNavigationItems,
    );
  }
}
