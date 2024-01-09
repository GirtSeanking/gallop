import 'package:fluent_ui/fluent_ui.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.placeSize});
  final Size placeSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: placeSize.width,
      height: placeSize.height,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: placeSize.height * .5,
              child: Lottie.asset("assets/lottie/daze.json")),
          const Gap(10),
          const Text("emmmm...我也不知道数据去哪了")
        ],
      )),
    );
  }
}
