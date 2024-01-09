import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gallop_web_flutter/common/components/empty.dart';
import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/car.dart';
import 'package:gallop_web_flutter/common/services/user_service.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gallop_web_flutter/pages/car_reservation/car_reservation.dart';
import 'package:gallop_web_flutter/pages/login/login.dart';

class CarInfo extends StatefulWidget {
  const CarInfo({super.key, required this.car});
  final Car car;

  @override
  State<CarInfo> createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  final UserService userService = UserService();
  List<String> imgUrls = [];
  _initData() {
    _initImgUrl();
  }

  _initImgUrl() {
    List<String> img =
        widget.car.carImgs!.split(",").map((e) => "$url$e").toList();
    setState(() {
      imgUrls.clear();
      imgUrls.addAll(img);
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
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: size.width * .3,
            height: size.height * .3,
            child: CardSwiper(
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) {
                if (imgUrls.isEmpty) {
                  return Empty(
                      placeSize: Size(size.width * .5, size.height * .6));
                } else {
                  return Container(
                    width: size.width * .3,
                    height: size.height * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(imgUrls[index]),
                      ),
                    ),
                  );
                }
              },
              cardsCount: imgUrls.isNotEmpty ? imgUrls.length : 1,
              numberOfCardsDisplayed: 1,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: size.height * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.car.carName ?? "",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.car.carDes ?? ""),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("所属门店：${widget.car.dept!.deptName ?? ""}"),
                      Text("联系电话：${widget.car.dept!.phone ?? ""}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.car.rent}元/天",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      Button(
                        child: const Text("开始预约"),
                        onPressed: () async {
                          String? token = userService.getToken();
                          if (!ObjectUtil.isNotEmpty(token)) {
                            // 跳转到登录页面
                            Navigator.of(
                              context,
                              rootNavigator: true,
                            ).push(FluentPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          } else {
                            Navigator.of(context, rootNavigator: true,).push(FluentPageRoute(builder: (context) {
                              return CarReservation(car: widget.car);
                            }));
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
