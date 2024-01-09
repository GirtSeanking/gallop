import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/activity.dart';
import 'package:gap/gap.dart';

class ActivityPanel extends StatelessWidget {
  const ActivityPanel({super.key, required this.activities});
  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    return CardSwiper(
      cardsCount: activities.length,
      cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
        Activity item = activities[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Image.network(
                  "$url${item.activityCover}",
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${item.activityTitle}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const Gap(10),
                      Text("${item.activityContent}")
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
