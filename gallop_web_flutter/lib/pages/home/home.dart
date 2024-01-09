import 'package:card_swiper/card_swiper.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gallop_web_flutter/common/api/activity.dart';
import 'package:gallop_web_flutter/common/api/car.dart';
import 'package:gallop_web_flutter/common/components/car_item.dart';
import 'package:gallop_web_flutter/common/components/empty.dart';
import 'package:gallop_web_flutter/common/components/loading.dart';
import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/activity.dart';
import 'package:gallop_web_flutter/common/model/car.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gallop_web_flutter/pages/home/widgets/activity_panel.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> activityList = [];
  List<Car> carList = [];
  bool isLoading = true;

  _loadActivityList() async {
    ActivityApi.getActivityList().then((res) {
      // 处理返回的数据
      if (ObjectUtil.isNotBlank(res.rows)) {
        List<Activity> result =
            res.rows!.map<Activity>((e) => Activity.fromJson(e)).toList();
        setState(() {
          activityList = result;
        });
      }
    });
  }

  _loadCarList() async {
    var param = {"pageNum": 1, "pageSize": 8};
    CarApi.getAllCarList(param).then((res) {
      // 处理返回的数据
      if (ObjectUtil.isNotBlank(res.rows)) {
        List<Car> result = res.rows!.map<Car>((e) => Car.fromJson(e)).toList();
        int total = res.total ?? 0;
        setState(() {
          carList = result.sublist(0, total >= 8 ? 8 : total);
        });
      }
    });
  }

  _initData() async {
    await _loadActivityList();
    await _loadCarList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(
      builder: (context) {
        if (isLoading) {
          return const LoadingPage();
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .44,
                  width: size.width,
                  child: Builder(builder: (context) {
                    if (activityList.isEmpty) {
                      return Empty(
                        placeSize: Size(size.width, size.height * .44),
                      );
                    }
                    return ActivityPanel(activities: activityList);
                  }),
                ),
                const Gap(30),
                SizedBox(
                  height: size.height * .7,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "在租车辆",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(15),
                      Builder(builder: (context) {
                        if (carList.isEmpty) {
                          return Empty(
                            placeSize: Size(size.width, size.height * .6),
                          );
                        }
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: carList.map<Widget>((e) {
                            return CarItem(car: e);
                          }).toList(),
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
