import 'package:fluent_ui/fluent_ui.dart';

class DialogUtil {
  static Future<bool> showContentDialog(BuildContext context,
      {String title = "提示",
      String content = "提示内容",
      String cancelText = "取消",
      String confirmText = "确认"}) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => ContentDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              Button(
                child: Text(cancelText),
                onPressed: () {
                  Navigator.pop(context, false);
                  // Delete file here
                },
              ),
              FilledButton(
                child: Text(confirmText),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
        ) ??
        false;
  }
}
