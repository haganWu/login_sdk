import 'package:flutter/material.dart';
import 'package:login_sdk/util/padding_extension.dart';
import 'package:login_sdk/widget/input_widget.dart';
import 'package:login_sdk/widget/login_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/string_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? userName;
  String? password;

  get _background {
    return [
      Positioned.fill(
          child: Image.network(
        'https://o.devio.org/images/bg_cover/robot.webp',
        fit: BoxFit.cover,
      )),
      Positioned.fill(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black54),
      ))
    ];
  }

  get _content {
    return Positioned.fill(
        left: 26,
        right: 26,
        top: 30,
        child: ListView(
          children: [
            36.paddingHeight,
            const Text(
              "ChatGPT",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            18.paddingHeight,
            InputWidget(
              hint: '请输入账号',
              onChanged: (text) {
                userName = text;
                _checkInput();
              },
            ),
            18.paddingHeight,
            InputWidget(
                hint: '请输入密码',
                obscureText: true,
                onChanged: (text) {
                  password = text;
                  _checkInput();
                }),
            36.paddingHeight,
            LoginButtonWidget(
              title: '登陆',
              enable: loginEnable,
              onPressed: () => _login(context),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: _jumpRegistration,
                child: const Text(
                  "注册账号",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 解决键盘弹起影响布局
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [..._background, _content],
      ),
    );
  }

  /// 注册
  _jumpRegistration() async {
    // 跳转到接口后台注册账号
    Uri uri = Uri.parse('https://api.devio.org/uapi/swagger-ui.html#/Account/registrationUsingPOST');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch:$uri');
    }
  }

  /// 检查输入框
  void _checkInput() {
    bool enable;
    if (isNotEmpty(userName) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
      debugPrint('loginEnable:$loginEnable');
    });
  }

  _login(BuildContext context) {}
}
