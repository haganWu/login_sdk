import 'package:flutter/material.dart';
import 'package:login_sdk/login_sdk.dart';
import 'package:login_sdk/pages/login_page.dart';

class NavigatorUtil {
  static BuildContext? _context;

  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
  }

  /// 跳转到指定页面
  static Future<T?> push<T extends Object?>(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  /// 跳转到首页
  static goToHome(BuildContext context) {
    if (LoginConfig.instance().homePage is Widget) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginConfig.instance().homePage!));
    } else {
      throw Exception('please call LoginConfig init() first');
    }
  }

  /// 跳转到登录页
  static goToLogin() {
    Navigator.pushReplacement(_context!, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
