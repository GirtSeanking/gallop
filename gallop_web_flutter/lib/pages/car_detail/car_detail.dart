import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/api/car.dart';
import 'package:gallop_web_flutter/common/components/car_item.dart';
import 'package:gallop_web_flutter/common/model/car.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gallop_web_flutter/pages/car_detail/widgets/car_info.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CarDetailPage extends StatefulWidget {
  const CarDetailPage({super.key, required this.car});
  final Car car;

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {

  List<Car> similarBrands = [];
  List<Car> similarCarType = [];

  _loadSimilarBrands() async {
    var queryParam = {"brandId": widget.car.brandId};
    CarApi.getAllCarListLimit(queryParam, 5).then((res) {
      if (ObjectUtil.isNotBlank(res.rows)) {
        List<Car> result = res.rows!.map((e) => Car.fromJson(e)).toList().where((element) => widget.car.carId! != element.carId).toList();
        if (result.isNotEmpty) {
          result.remove(widget.car);
          setState(() {
            similarBrands.clear();
            similarBrands.addAll(result);
          });
        }
      }
    });
  }

  _loadSimilarCarType() async {
    var queryParam = {"carTypeId": widget.car.carTypeId};
    CarApi.getAllCarListLimit(queryParam, 5).then((res) {
      if (ObjectUtil.isNotBlank(res.rows)) {
        List<Car> result = res.rows!.map((e) => Car.fromJson(e)).toList().where((element) => widget.car.carId! != element.carId).toList();
        if (result.isNotEmpty) {
          result.remove(widget.car);
          setState(() {
            similarCarType.clear();
            similarCarType.addAll(result);
          });
        }
      }
    });
  }

  _initData() async {
    await _loadSimilarBrands();
    await _loadSimilarCarType();
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(widget.car.carName ?? ""),
        leading: IconButton(
          icon: const Icon(FluentIcons.back),
          onPressed: () => context.pop(),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarInfo(car: widget.car),
              const Gap(10),
              const Text("品牌推荐", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black,),),
              const Gap(10),
              SizedBox(
                height: (size.height * .6 - 10) / 2 + 16,
                child: Builder(builder: (context) {
                  if (similarBrands.isEmpty) {
                    return const Center(child: Text("暂无推荐"),);
                  } else {
                    return Row(
                      children: similarBrands.map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CarItem(car: e),
                      )).toList(),
                    );
                  }
                }),
              ),
              const Gap(10),
              const Text("车型推荐", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black,),),
              const Gap(10),
              SizedBox(
                height: (size.height * .6 - 10) / 2 + 16,
                child: Builder(builder: (context) {
                  if (similarCarType.isEmpty) {
                    return const Center(child: Text("暂无推荐"),);
                  } else {
                    return Row(
                      children: similarCarType.map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CarItem(car: e),
                      )).toList(),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
