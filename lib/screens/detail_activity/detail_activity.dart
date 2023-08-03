import 'package:bricket_app/providers/detail_activity_provider.dart';
import 'package:bricket_app/widgets/appbar/leading_custom.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class DetailActivity extends StatelessWidget {
  final String activityId;

  const DetailActivity({
    super.key,
    required this.activityId,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const LeadingCustom(),
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
            DetailActivityProvider(context: context, activityId: activityId),
        child: ListView(
          padding: const EdgeInsets.all(14.0),
          children: [
            const Text(
              "Grafik Suhu",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Consumer<DetailActivityProvider>(
              builder: (context, state, _) {
                return state.getLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Transform.rotate(
                                origin: Offset.zero,
                                angle: -math.pi / 2,
                                child: Text(
                                  "Suhu",
                                ),
                              ),
                              SizedBox(
                                width: size.width - 80,
                                height: size.width - 80,
                                child: DChartLine(
                                  data: [
                                    {
                                      'id': 'suhu',
                                      'data': state.getListSuhu,
                                    },
                                  ],
                                  lineColor: (lineData, index, id) =>
                                      Colors.amber,
                                  animate: true,
                                ),
                              ),
                            ],
                          ),
                          Text("Waktu")
                        ],
                      );
              },
            ),
            const SizedBox(height: 36),
            const Text(
              "Grafik Asap",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Consumer<DetailActivityProvider>(
              builder: (context, state, _) {
                return state.getLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              Transform.rotate(
                                origin: Offset.zero,
                                angle: -math.pi / 2,
                                child: Text(
                                  "Asap",
                                ),
                              ),
                              SizedBox(
                                width: size.width - 80,
                                height: size.width - 80,
                                child: DChartLine(
                                  data: [
                                    {
                                      'id': 'asap',
                                      'data': state.getListSmoke,
                                    },
                                  ],
                                  lineColor: (lineData, index, id) =>
                                      Colors.pink,
                                  animate: true,
                                ),
                              ),
                            ],
                          ),
                          Text("Waktu")
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
