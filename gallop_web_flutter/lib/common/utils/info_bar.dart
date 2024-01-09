import 'package:fluent_ui/fluent_ui.dart';

class InfoBarUtil {
  static Future<void> successToast(BuildContext context,
      {String title = "成功", String content = "成功内容"}) async {
    await displayInfoBar(context, builder: (context, close) {
      return InfoBar(
        title: Text(title),
        content: Text(content),
        action: IconButton(
          icon: const Icon(FluentIcons.clear),
          onPressed: close,
        ),
        severity: InfoBarSeverity.success,
      );
    });
  }

  static Future<void> warningToast(BuildContext context,
      {String title = "警告", String content = "警告内容"}) async {
    await displayInfoBar(context, builder: (context, close) {
      return InfoBar(
        title: Text(title),
        content: Text(content),
        action: IconButton(
          icon: const Icon(FluentIcons.clear),
          onPressed: close,
        ),
        severity: InfoBarSeverity.warning,
      );
    });
  }

  static Future<void> errorToast(BuildContext context,
      {String title = "错误", String content = "错误内容"}) async {
    await displayInfoBar(context, builder: (context, close) {
      return InfoBar(
        title: Text(title),
        content: Text(content),
        action: IconButton(
          icon: const Icon(FluentIcons.clear),
          onPressed: close,
        ),
        severity: InfoBarSeverity.error,
      );
    });
  }
}
