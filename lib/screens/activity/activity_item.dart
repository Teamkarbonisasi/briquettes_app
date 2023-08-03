import 'package:bricket_app/screens/detail_activity/detail_activity.dart';
import 'package:bricket_app/shared/theme.dart';
import 'package:bricket_app/widgets/buttons/elevated_button_custom.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String activityId;
  final String startTime;
  final String endTime;
  final String date;

  const ActivityItem({
    super.key,
    required this.activityId,
    required this.startTime,
    required this.endTime,
    required this.date,
  });

  void moveToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailActivity(activityId: activityId);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            color: secondaryColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                "assets/images/image_burn.png",
                width: 36,
                height: 36,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tanggal",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  date,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Waktu",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "$startTime - $endTime",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(width: 14),
          ElevatedButtonCustom(
            text: "Lihat\nGrafik",
            padding: const EdgeInsets.all(8.0),
            borderRadius: BorderRadius.circular(8),
            onPressed: () => moveToDetail(context),
          )
        ],
      ),
    );
  }
}
