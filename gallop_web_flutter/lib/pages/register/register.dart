import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/api/user.dart';
import 'package:gallop_web_flutter/common/model/user.dart';
import 'package:gallop_web_flutter/common/utils/info_bar.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gallop_web_flutter/pages/login/login.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  _registerHandle() async {
    if (!ObjectUtil.isNotEmpty(username.text)) {
      InfoBarUtil.warningToast(context, title: "校验失败", content: "请输入用户名");
      return;
    }
    if (!ObjectUtil.isNotEmpty(password.text)) {
      InfoBarUtil.warningToast(context, title: "校验失败", content: "请输入密码");
      return;
    }
    User loginForm = User();
    loginForm.userName = username.text;
    loginForm.password = password.text;
    UserApi.registerRequest(loginForm).then((res) {
      if (res.code == 200) {
        InfoBarUtil.successToast(context, content: "注册成功！请登录");
        _loginJump();
      } else {
        InfoBarUtil.errorToast(context,
            title: "错误代码：${res.code ?? ""}", content: res.msg ?? "");
      }
    });
  }

  _loginJump() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      FluentPageRoute(builder: (context) {
        return const LoginPage();
      }),
    );
  }

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
          title: Text('注册'),
        ),
        content: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "欢迎注册驰行租车",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              SizedBox(
                width: size.width * .25,
                height: size.height * .4,
                child: Column(
                  children: [
                    TextBox(
                      controller: username,
                      placeholder: "用户名",
                    ),
                    const Gap(10),
                    PasswordBox(
                      controller: password,
                      placeholder: "密码",
                      revealMode: PasswordRevealMode.peekAlways,
                    ),
                    const Gap(10),
                    FilledButton(
                      onPressed: _registerHandle,
                      child: const Text('注册'),
                    ),
                    const Gap(10),
                    Button(
                        onPressed: _loginJump, child: const Text("已有账户？开始登录"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
