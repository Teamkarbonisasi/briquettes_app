import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavigationItems = [
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      size: 28,
    ),
    label: 'Beranda',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.event_note,
      size: 28,
    ),
    label: 'Aktivitas',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.person,
      size: 28,
    ),
    label: 'Profil',
  ),
];
