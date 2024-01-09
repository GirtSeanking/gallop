import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:gallop_web_flutter/common/components/loading.dart';
import 'package:gallop_web_flutter/common/routes/pages.dart';
import 'package:gallop_web_flutter/common/services/storage_service.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool loading = true;

  _init() async {
    await StorageService().init();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const LoadingPage();
    } else {
      return FluentApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        theme: FluentThemeData(fontFamily: "WeiRuanYaHei"),
      );
    }
  }
}
