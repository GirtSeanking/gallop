import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/api/user.dart';
import 'package:gallop_web_flutter/common/model/user.dart';
import 'package:gallop_web_flutter/common/services/user_service.dart';
import 'package:gallop_web_flutter/common/utils/info_bar.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gallop_web_flutter/pages/register/register.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onLoginSuccess});
  final Function(String username)? onLoginSuccess;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  _loginHandle() async {
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
    UserService userService = UserService();
    UserApi.loginRequest(loginForm).then((res) {
      if (res.code == 200) {
        if (ObjectUtil.isNotEmpty(res.token)) {
          loginForm.token = res.token;
          userService.saveUserInfo(loginForm);
          if (ObjectUtil.isNotBlank(widget.onLoginSuccess)) {
            widget.onLoginSuccess!(loginForm.userName!);
          }
          context.pop();
        }
      } else {
        InfoBarUtil.errorToast(context,
            title: "错误代码：${res.code ?? ""}", content: res.msg ?? "");
      }
    });
  }

  _registerJump() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      FluentPageRoute(builder: (context) {
        return const RegisterPage();
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
          title: Text('登录'),
        ),
        content: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "欢迎登录驰行租车",
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
                      onPressed: _loginHandle,
                      child: const Text('登录'),
                    ),
                    const Gap(10),
                    Button(
                        onPressed: _registerJump, child: const Text("没有账户？注册"))
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
