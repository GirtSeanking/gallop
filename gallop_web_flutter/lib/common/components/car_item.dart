import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/http/request.dart';
import 'package:gallop_web_flutter/common/model/car.dart';
import 'package:gallop_web_flutter/pages/car_detail/car_detail.dart';

class CarItem extends StatelessWidget {
  const CarItem({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true,).push(FluentPageRoute(builder: (context) {
          return CarDetailPage(car: car);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                spreadRadius: 1,
                blurRadius: 1,
              )
            ]),
        width: (size.width - 62) / 4,
        height: (size.height * .6 - 10) / 2,
        child: Column(
          children: [
            Container(
              width: (size.width - 62) / 4,
              height: (size.height * .6 - 10) / 2 - 85,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("$url${car.carImgs!.split(",")[0]}"))),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              height: 85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    car.carName ?? "",
                    style: const TextStyle(fontSize: 25),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        car.dept!.deptName ?? "",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.withOpacity(.4)),
                      ),
                      Text(
                        "${car.rent ?? ""}元",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
