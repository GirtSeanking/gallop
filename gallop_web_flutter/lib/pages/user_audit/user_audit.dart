import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

class UserAuditPage extends StatefulWidget {
  const UserAuditPage({super.key});

  @override
  State<UserAuditPage> createState() => _UserAuditPageState();
}

class _UserAuditPageState extends State<UserAuditPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NavigationView(
      appBar: NavigationAppBar(
        leading: IconButton(
          icon: const Icon(FluentIcons.back),
          onPressed: () => context.pop(),
        ),
      ),
      content: ScaffoldPage(
        header: const PageHeader(
          title: Text('身份认证审核'),
        ),
        content: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: size.width * .7,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.4),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: (size.width * .7 - 64) / 2,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text("请上传身份证正面"),
                        ),
                      ),
                      Container(
                        width: (size.width * .7 - 64) / 2,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text("请上传身份证反面"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
