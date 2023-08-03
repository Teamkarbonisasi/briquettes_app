import 'package:bricket_app/providers/main_provider.dart';
import 'package:bricket_app/widgets/appbar/appbar_main_custom.dart';
import 'package:bricket_app/widgets/bottom_navigation/bottom_navigation_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(context),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 60),
          child: Consumer<MainProvider>(
            builder: (context, state, _) {
              return AppbarMainCustom(
                fullname: state.getName,
                isOffline: state.getIsOffline,
              );
            },
          ),
        ),
        body: Consumer<MainProvider>(
          builder: (context, state, _) {
            return state.getScreens[state.getActiveIndex];
          },
        ),
        bottomNavigationBar: Consumer<MainProvider>(
          builder: (context, state, _) {
            return BottomNavigationCustom(
              currentIndex: state.getActiveIndex,
              onTap: (index) {
                state.setActiveIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
