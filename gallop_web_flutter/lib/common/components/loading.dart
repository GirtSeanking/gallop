import 'package:fluent_ui/fluent_ui.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(color: Colors.black),
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Lottie.asset("assets/lottie/loading.json"),
        ),
      ),
    );
  }
}
