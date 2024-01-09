import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gallop_web_flutter/common/api/order.dart';
import 'package:gallop_web_flutter/common/components/empty.dart';
import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/order.dart';
import 'package:gallop_web_flutter/common/services/user_service.dart';
import 'package:gallop_web_flutter/common/utils/dialog_util.dart';
import 'package:gallop_web_flutter/common/utils/info_bar.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  final UserService userService = UserService();
  List<Order> orderList = [];
  bool isLoading = true;
  Map orderStatusMap = {
    "0": "取消",
    "1": "出租驳回",
    "2": "还车驳回",
    "3": "出租审核中",
    "4": "还车审核中",
    "5": "出租中",
    "6": "完成"
  };

  _loadOrderList() async {
    String username = userService.getUserUsername() ?? "";
    if (ObjectUtil.isNotEmpty(username)) {
      OrderApi.getCustomerOrders(username).then((res) {
        if (ObjectUtil.isNotBlank(res.rows)) {
          List<Order> result =
              res.rows!.map<Order>((e) => Order.fromJson(e)).toList();
          setState(() {
            orderList.clear();
            orderList.addAll(result);
          });
        }
      });
    } else {
      InfoBarUtil.errorToast(context, title: "无效权限", content: "登录过期，请登录");
    }
  }

  _updateOrderStatus(int? orderId, String status) async {
    String username = userService.getUserUsername() ?? "";
    if (ObjectUtil.isNotEmpty(username)) {
      if (ObjectUtil.isNotBlank(orderId)) {
        final bool result = await DialogUtil.showContentDialog(context);
        if (result) {
          OrderApi.customerUpdateOrder(orderId!, username, status)
              .then((res) async {
            if (res.code == 200) {
              InfoBarUtil.successToast(context, content: res.msg!);
              setState(() {
                isLoading = true;
              });
              await _loadOrderList();
              setState(() {
                isLoading = false;
              });
            }
          });
        }
      } else {
        InfoBarUtil.errorToast(context, title: "数据异常", content: "数据丢失，或请刷新页面");
      }
    } else {
      InfoBarUtil.errorToast(context, title: "无效权限", content: "登录过期，请登录");
    }
  }

  _initImgUrl(String images) {
    List<String> img = images.split(",").map((e) => "$url$e").toList();
    return img;
  }

  _initData() async {
    await _loadOrderList();
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Builder(
        builder: (context) {
          if (orderList.isEmpty) {
            return const Center(
              child: Text("暂无订单信息"),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: orderList.map((e) {
                  List<String> imgUrls = _initImgUrl(e.carInfo!.carImgs!);
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
                            cardBuilder: (context, index, percentThresholdX,
                                percentThresholdY) {
                              if (imgUrls.isEmpty) {
                                return Empty(
                                    placeSize: Size(
                                        size.width * .5, size.height * .6));
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
                                e.carInfo!.carName ?? "",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(e.carInfo!.carDes ?? ""),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("所属门店：${e.dept!.deptName ?? ""}"),
                                  Text("联系电话：${e.dept!.phone ?? ""}"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("订单截止日期：${e.endTime ?? ""}"),
                                  Text("日租金：${e.priceDay ?? ""}"),
                                  Text("订单总价：${e.priceTotal ?? ""}")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("订单状态：${orderStatusMap[e.status]}"),
                                  Builder(builder: (context) {
                                    if (e.status == "2") {
                                      return FilledButton(
                                          onPressed: () {
                                            _updateOrderStatus(e.orderId, "4");
                                          },
                                          child: const Text("还车"));
                                    } else if (e.status == "3") {
                                      return FilledButton(
                                          onPressed: () {
                                            _updateOrderStatus(e.orderId, "0");
                                          },
                                          child: const Text("取消订单"));
                                    } else if (e.status == "5") {
                                      return FilledButton(
                                          onPressed: () {
                                            _updateOrderStatus(e.orderId, "4");
                                          },
                                          child: const Text("还车"));
                                    } else {
                                      return Container();
                                    }
                                  })
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
