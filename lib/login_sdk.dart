library login_sdk;

import 'package:flutter/cupertino.dart';
import 'package:flutter_hi_cache/flutter_hi_cache.dart';

class LoginConfig {
  static LoginConfig? _instance;
  // 私有构造
  LoginConfig._();
  static LoginConfig instance() {
    _instance ??= LoginConfig._();
    return _instance!;
  }

  Widget? homePage;

  /// 初始化登陆配置
  Future<void> init({required Widget homePage}) async {
    this.homePage = homePage;
    await HiCache.preInit();
  }
}
