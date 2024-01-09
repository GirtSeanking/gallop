import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/api/brand.dart';
import 'package:gallop_web_flutter/common/api/car.dart';
import 'package:gallop_web_flutter/common/api/car_type.dart';
import 'package:gallop_web_flutter/common/components/car_item.dart';
import 'package:gallop_web_flutter/common/components/empty.dart';
import 'package:gallop_web_flutter/common/model/brand.dart';
import 'package:gallop_web_flutter/common/model/car.dart';
import 'package:gallop_web_flutter/common/model/car_type.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gap/gap.dart';

class RentalPage extends StatefulWidget {
  const RentalPage({super.key});

  @override
  State<RentalPage> createState() => _RentalPageState();
}

class _RentalPageState extends State<RentalPage> {
  List<Car> carList = [];
  List<Brand> brandList = [];
  List<CarType> carTypeList = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  Map<String, dynamic> queryParams = {};

  _loadAllBrand() async {
    BrandApi.getAllBrands().then((res) {
      if (ObjectUtil.isNotBlank(res.data)) {
        List<Brand> result =
            res.data!.map<Brand>((e) => Brand.fromJson(e)).toList();
        setState(() {
          brandList = result;
        });
      }
    });
  }

  _loadAllCarType() async {
    CarTypeApi.getAllBrands().then((res) {
      if (ObjectUtil.isNotBlank(res.data)) {
        List<CarType> result =
            res.data!.map<CarType>((e) => CarType.fromJson(e)).toList();
        setState(() {
          carTypeList = result;
        });
      }
    });
  }

  _loadCarInfo() async {
    CarApi.getAllCarList(queryParams).then((res) {
      if (ObjectUtil.isNotBlank(res.rows)) {
        List<Car> result = res.rows!.map<Car>((e) => Car.fromJson(e)).toList();
        setState(() {
          carList = result;
        });
      }
    });
  }

  _initData() async {
    await _loadAllBrand();
    await _loadAllCarType();
    await _loadCarInfo();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _onSelected(Iterable<TreeViewItem> items) async {
    TreeViewItem selected = items.first;
    if (ObjectUtil.isNotBlank(selected.parent)) {
      switch (selected.parent!.value) {
        case "brand":
          queryParams["brandId"] = selected.value;
          _loadCarInfo();
          break;
        case "carType":
          queryParams["carTypeId"] = selected.value;
          _loadCarInfo();
          break;
        default:
          break;
      }
    }
  }

  void _onSearchChanged(String value) {
      queryParams['carName'] = value;
      _loadCarInfo();
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextBox(
              controller: searchController,
              placeholder: "根据名字搜索",
              onChanged: _onSearchChanged,
            ),
            const Gap(8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: TreeView(
                    selectionMode: TreeViewSelectionMode.single,
                    items: [
                      TreeViewItem(
                        content: const Text("品牌"),
                        value: "brand",
                        children: [
                          TreeViewItem(content: const Text("全部")),
                          ...brandList
                              .map((e) => TreeViewItem(
                                    content: Text(e.brandName ?? ""),
                                    value: e.brandId,
                                  ))
                              .toList()
                        ],
                      ),
                      TreeViewItem(
                        content: const Text("车型"),
                        value: "carType",
                        children: [
                          TreeViewItem(content: const Text("全部")),
                          ...carTypeList
                              .map((e) => TreeViewItem(
                                    content: Text(e.carTypeName ?? ""),
                                    value: e.carTypeId,
                                  ))
                              .toList()
                        ],
                      ),
                    ],
                    onSelectionChanged: _onSelected,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Builder(
                    builder: (context) {
                      if (carList.isEmpty) {
                        return const Empty(
                          placeSize: Size.zero,
                        );
                      }
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: carList.map<Widget>((e) {
                              return CarItem(car: e);
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const Gap(8)
          ],
        ),
      ),
    );
  }
}
