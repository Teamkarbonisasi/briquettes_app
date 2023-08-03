import 'package:bricket_app/providers/main_provider.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.6,
            child: ListView(
              children: [
                SizedBox(
                  width: size.width,
                  child: Card(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const Text(
                            "KADAR ASAP SAAT INI",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(height: 36.0),
                          Consumer<MainProvider>(
                            builder: (context, state, _) {
                              return Text(
                                "${state.getSmoke.toStringAsFixed(2)}%",
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18.0),
                // temperature
                SizedBox(
                  width: size.width,
                  child: Card(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          const Text(
                            "SUHU SAAT INI",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(height: 36.0),
                          Consumer<MainProvider>(
                            builder: (context, state, _) {
                              return Text(
                                "${state.getTemperature.toString()}°C",
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28.0),
          Consumer<MainProvider>(
            builder: (context, state, _) {
              return ElevatedButtonCustom(
                text: state.getSensorState
                    ? "STOP PEMBAKARAN"
                    : "MULAI PEMBAKARAN",
                fontSize: 18.0,
                size: Size.fromWidth(size.width),
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 28.0,
                ),
                onPressed: state.changeRecording,
              );
            },
          ),
        ],
      ),
    );
  }
}
