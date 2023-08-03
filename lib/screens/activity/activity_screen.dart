import 'package:bricket_app/providers/main_provider.dart';
import 'package:bricket_app/screens/activity/activity_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, state, _) {
        return ListView(
          children: state.getHistories.map((item) {
            int index = state.getHistories.indexOf(item);

            return ActivityItem(
              activityId: state.getHistoryId[index],
              date: item["date"],
              startTime: item["startTime"],
              endTime: item["endTime"],
            );
          }).toList(),
        );
      },
    );
  }
}
