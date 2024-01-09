import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/api/user.dart';
import 'package:gallop_web_flutter/common/model/user.dart';
import 'package:gallop_web_flutter/common/services/user_service.dart';
import 'package:gallop_web_flutter/common/utils/info_bar.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserService userService = UserService();
  User userForm = User();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  String sex = "2";
  final sexList = {"0": "男", "1": "女", "2": "未知"};

  _showResetPassDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return ContentDialog(
            title: const Text("重设密码"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoLabel(
                  label: "旧密码",
                  child: PasswordBox(
                    placeholder: "旧密码",
                    controller: oldPassController,
                  ),
                ),
                InfoLabel(
                  label: "新密码",
                  child: PasswordBox(
                    placeholder: "新密码",
                    controller: newPassController,
                  ),
                ),
              ],
            ),
            actions: [
              Button(
                  child: const Text("取消"),
                  onPressed: () {
                    oldPassController.text = "";
                    newPassController.text = "";
                    context.pop();
                  }),
              FilledButton(onPressed: _resetUserPass, child: const Text("确认"))
            ],
          );
        });
  }

  _resetUserPass() async {
    if (oldPassController.text.isEmpty) {
      InfoBarUtil.warningToast(context, content: "旧密码不能为空");
      return;
    }
    if (newPassController.text.isEmpty) {
      InfoBarUtil.warningToast(context, content: "新密码不能为空");
      return;
    }

    if (ObjectUtil.isNotBlank(userForm.userId)) {
      UserApi.resetPass(
              userForm.userId!, oldPassController.text, newPassController.text)
          .then((res) {
        if (res.code == 200) {
          InfoBarUtil.successToast(context, content: res.msg!);
          context.pop();
        } else {
          InfoBarUtil.errorToast(context,
              title: "错误代码：${res.code ?? ""}", content: res.msg ?? "");
        }
      });
    } else {
      InfoBarUtil.errorToast(context, title: "请求失败", content: "请刷新页面重试");
    }
  }

  _submitForm() async {
    if (ObjectUtil.isNotBlank(userForm.userId)) {
      UserApi.updateUserInfo(
              userForm.userId!, emailController.text, phoneController.text, sex)
          .then((res) {
        if (res.code == 200) {
          InfoBarUtil.successToast(context, content: res.msg!);
        } else {
          InfoBarUtil.errorToast(context,
              title: "错误代码：${res.code ?? ""}", content: res.msg ?? "");
        }
      });
    } else {
      InfoBarUtil.errorToast(context, title: "请求失败", content: "请刷新页面重试");
    }
  }

  _loadData() async {
    String username = userService.getUserUsername() ?? "";
    if (ObjectUtil.isNotEmpty(username)) {
      UserApi.getUserInfo(username).then((res) {
        if (res.code == 200) {
          setState(() {
            userForm = User.fromJson(res.data);
            phoneController.text = userForm.phoneNumber ?? "";
            emailController.text = userForm.email ?? "";
            sex = userForm.sex ?? "2";
          });
        } else {
          InfoBarUtil.errorToast(context,
              title: "错误代码：${res.code ?? ""}", content: res.msg ?? "");
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Builder(
        builder: (context) {
          if (ObjectUtil.isNotBlank(userForm.userId)) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.4),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userForm.userName ?? "",
                    style: const TextStyle(fontSize: 30),
                  ),
                  const Gap(10),
                  InfoLabel(
                    label: "联系电话",
                    child: TextBox(
                      placeholder: "电话号码",
                      controller: phoneController,
                    ),
                  ),
                  const Gap(10),
                  InfoLabel(
                    label: "联系邮箱",
                    child: TextBox(
                      placeholder: "邮箱",
                      controller: emailController,
                    ),
                  ),
                  const Gap(10),
                  InfoLabel(
                    label: "性别",
                    child: ComboBox<String>(
                      value: sex,
                      items: sexList.keys
                          .map(
                            (e) => ComboBoxItem(
                              value: e,
                              child: Text(sexList[e] ?? ""),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        if (ObjectUtil.isNotBlank(val)) {
                          setState(() {
                            sex = val!;
                          });
                        }
                      },
                    ),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton(
                        onPressed: _submitForm,
                        child: const Text("保存修改"),
                      ),
                      FilledButton(
                        child: const Text("重置密码"),
                        onPressed: () {
                          _showResetPassDialog(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("用户信息丢失，请重新登录进行重试"),
            );
          }
        },
      ),
    );
  }
}
