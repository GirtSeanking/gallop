import 'package:fluent_ui/fluent_ui.dart';
import 'package:gallop_web_flutter/common/routes/name.dart';
import 'package:gallop_web_flutter/common/routes/pages.dart';
import 'package:gallop_web_flutter/common/services/user_service.dart';
import 'package:gallop_web_flutter/common/utils/info_bar.dart';
import 'package:gallop_web_flutter/common/utils/object_util.dart';
import 'package:gallop_web_flutter/pages/login/login.dart';
import 'package:go_router/go_router.dart';

const String appTitle = '驰行在线租车';
final viewKey = GlobalKey(debugLabel: 'Navigation View Key');

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key, required this.child, this.shellContext});
  final Widget child;
  final BuildContext? shellContext;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final UserService userService = UserService();
  String username = "";
  late final List<NavigationPaneItem> originalItems = [
    PaneItem(
      key: const ValueKey(RouteName.home),
      icon: const Icon(FluentIcons.home),
      title: const Text('首页'),
      body: const SizedBox.shrink(),
    ),
    PaneItem(
      key: const ValueKey(RouteName.rental),
      icon: const Icon(FluentIcons.car),
      title: const Text('在线租车'),
      body: const SizedBox.shrink(),
    ),
    PaneItemExpander(
        key: const ValueKey(RouteName.account),
        icon: const Icon(FluentIcons.account_management),
        title: const Text("个人中心"),
        items: [
          PaneItem(
            key: const ValueKey(RouteName.profile),
            icon: const Icon(FluentIcons.contact),
            title: const Text("个人资料"),
            body: const SizedBox.shrink(),
          ),
          PaneItem(
            key: const ValueKey(RouteName.myOrder),
            icon: const Icon(FluentIcons.clipboard_list),
            title: const Text("我的订单"),
            body: const SizedBox.shrink(),
          ),
        ],
        body: const SizedBox.shrink())
  ].map<NavigationPaneItem>((_) {
    PaneItem buildPaneItem(PaneItem item) {
      return PaneItem(
        key: item.key,
        icon: item.icon,
        title: item.title,
        body: item.body,
        onTap: () async {
          final path = (item.key as ValueKey).value;
          if (GoRouterState.of(context).uri.toString() != path) {
            // TODO 尝试判断登录，如果不是登录状态则跳转至登录界面
            String? token = userService.getToken();
            if (path.toString().contains("account") && !ObjectUtil.isNotBlank(token)) {
              InfoBarUtil.errorToast(context, title: "无效权限", content: "请先登录");
              // Navigator.of(
              //   context,
              //   rootNavigator: false,
              // ).push(
              //   FluentPageRoute(builder: (context) {
              //     return const LoginPage();
              //   }),
              // );
            } else {
              context.go(path);
            }

          }
          item.onTap?.call();
        },
      );
    }

    if (_ is PaneItemExpander) {
      return PaneItemExpander(
        key: _.key,
        icon: _.icon,
        title: _.title,
        body: _.body,
        items: _.items.map((item) {
          if (item is PaneItem) return buildPaneItem(item);
          return item;
        }).toList(),
      );
    }
    return buildPaneItem(_);
  }).toList();

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    List<NavigationPaneItem> items = originalItems
        .where((item) => item.key != null)
        .toList();
    int indexOriginal = originalItems
        .where((item) => item.key != null)
        .toList().indexWhere((element) => element.key == Key(location));
    for (int i = 0; i < items.length; i ++) {
      NavigationPaneItem element = items[i];
      if (element.key == const Key(RouteName.account)) {
        PaneItemExpander paneItemExpander = element as PaneItemExpander;
        bool selected = paneItemExpander.items.where((element) => element.key == Key(location)).toList().isNotEmpty;
        if (selected) {
          return i;
        }
      } else {
        PaneItem paneItem = element as PaneItem;
        if (paneItem.key == Key(location)) {
          return i;
        }
      }
    }

    // if (indexOriginal == -1) {
    //   int indexFooter = footerItems
    //       .where((element) => element.key != null)
    //       .toList()
    //       .indexWhere((element) => element.key == Key(location));
    //   if (indexFooter == -1) {
    //     return 0;
    //   }
    //   return originalItems
    //           .where((element) => element.key != null)
    //           .toList()
    //           .length +
    //       indexFooter;
    // } else {
    //   return indexOriginal;
    // }
    return indexOriginal;
  }

  @override
  void initState() {
    super.initState();
    username = userService.getUserUsername() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final localizations = FluentLocalizations.of(context);

    if (widget.shellContext != null) {
      if (router.canPop() == false) {
        setState(() {});
      }
    }
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        leading: () {
          final enabled = widget.shellContext != null && router.canPop();
          final onPressed = enabled
              ? () {
                  if (router.canPop()) {
                    context.pop();
                    setState(() {});
                  }
                }
              : null;
          return NavigationPaneTheme(
            data: NavigationPaneTheme.of(context).merge(NavigationPaneThemeData(
                unselectedIconColor: ButtonState.resolveWith((states) {
              if (states.isDisabled) {
                return ButtonThemeData.buttonColor(context, states);
              }
              return ButtonThemeData.uncheckedInputColor(
                FluentTheme.of(context),
                states,
              ).basedOnLuminance();
            }))),
            child: Builder(
              builder: (context) => PaneItem(
                icon: const Center(child: Icon(FluentIcons.back, size: 12.0)),
                title: Text(localizations.backButtonTooltip),
                body: const SizedBox.shrink(),
                enabled: enabled,
              ).build(
                context,
                false,
                onPressed,
                displayMode: PaneDisplayMode.compact,
              ),
            ),
          );
        }(),
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Builder(builder: (context) {
              if (username.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(child: const Text("登录"), onPressed: () {
                    Navigator.of(
                      context,
                      rootNavigator: false,
                    ).push(
                      FluentPageRoute(builder: (context) {
                        return LoginPage(onLoginSuccess: (value) {
                          setState(() {
                            username = value;
                          });
                        },);
                      }),
                    );
                  }),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("当前账户：$username"),
                  ),
                );
              }
            })
          ],
        ),
        title: () {
          return const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(appTitle),
          );
        }(),
      ),
      paneBodyBuilder: (item, child) {
        final name =
            item?.key is ValueKey ? (item!.key as ValueKey).value : null;
        return FocusTraversalGroup(
          key: ValueKey('body$name'),
          child: widget.child,
        );
      },
      pane: NavigationPane(
        selected: _calculateSelectedIndex(context),
        displayMode: PaneDisplayMode.top,
        indicator: const StickyNavigationIndicator(),
        items: originalItems,
      ),
    );
  }
}
