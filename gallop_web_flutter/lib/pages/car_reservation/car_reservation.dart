import 'package:date_format/date_format.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/api/order.dart';
import 'package:gallop_web_flutter/common/model/car.dart';
import 'package:gallop_web_flutter/common/services/user_service.dart';
import 'package:gallop_web_flutter/common/utils/info_bar.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gallop_web_flutter/pages/car_detail/widgets/car_info.dart';
import 'package:gallop_web_flutter/pages/login/login.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CarReservation extends StatefulWidget {
  const CarReservation({super.key, required this.car});
  final Car car;

  @override
  State<CarReservation> createState() => _CarReservationState();
}

class _CarReservationState extends State<CarReservation> {
  final UserService userService = UserService();
  num days = 0;
  num priceTotal = 0;
  DateTime endTime = DateTime.now();
  String endTimeStr =
      formatDate(DateTime.now(), [yyyy, "-", mm, "-", dd]).toString();
  bool loading = false;

  void _daysChanged(num? value) {
    if (ObjectUtil.isNotBlank(value)) {
      endTime = DateTime.now();
      endTime = endTime.add(Duration(days: value!.toInt()));
      setState(() {
        days = value;
        priceTotal = days * widget.car.rent!;
        endTimeStr = formatDate(endTime, [yyyy, "-", mm, "-", dd]).toString();
      });
    }
  }

  void _onSubmitOrder() {
    setState(() {
      loading = true;
    });
    String username = userService.getUserUsername() ?? "";
    if (ObjectUtil.isNotEmpty(username)) {
      var params = {
        "username": username,
        "carId": widget.car.carId!,
        "brandId": widget.car.brandId!,
        "carTypeId": widget.car.carTypeId,
        "deptId": widget.car.deptId,
        "rentalDay": days,
        "endTime": endTimeStr,
        "priceDay": widget.car.rent!,
        "priceTotal": priceTotal,
        "payStatus": "0",
        "status": "3"
      };
      OrderApi.addOrder(params).then((res) {
        if (res.code == 200) {
          InfoBarUtil.successToast(context, title: "预约成功", content: "请于我的订单页面查看预约状态").then((value) => context.pop());
        } else {
          InfoBarUtil.errorToast(context, title: "请求失败", content: res.msg ?? "");
        }
      });
      setState(() {
        loading = false;
      });
    } else {
      InfoBarUtil.errorToast(context, title: "无效权限", content: "请重新登录").then(
        (value) => Navigator.of(
          context,
          rootNavigator: true,
        ).push(
          FluentPageRoute(builder: (context) {
            return const LoginPage();
          }),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(widget.car.carName ?? ""),
        leading: IconButton(
          icon: const Icon(FluentIcons.back),
          onPressed: () => context.pop(),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarInfo(car: widget.car),
            const Gap(10),
            const Text(
              "订单信息",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Gap(10),
            InfoLabel(
              label: '输入租用天数:',
              child: NumberBox(
                value: days,
                onChanged: _daysChanged,
                mode: SpinButtonPlacementMode.none,
              ),
            ),
            const Gap(15),
            Text("订单截止日期：$endTimeStr"),
            const Gap(5),
            Text(
              "总价格：$priceTotal",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  if (loading) {
                    return const ProgressRing();
                  } else {
                    return FilledButton(
                      onPressed: _onSubmitOrder,
                      child: const Text("确认订单"),
                    );
                  }
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
