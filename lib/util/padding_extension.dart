import 'package:flutter/cupertino.dart';

/// 扩展int类型padding
extension IntFix on int {
  /// eg: 200.px
  SizedBox get paddingHeight {
    return SizedBox(height: toDouble());
  }

  SizedBox get paddingWidth {
    return SizedBox(width: toDouble());
  }
}

/// 扩展double类型padding
extension DoubleFix on double {
  /// eg: 200.0.px
  SizedBox get paddingHeight {
    return SizedBox(height: this);
  }

  SizedBox get paddingWidth {
    return SizedBox(width: this);
  }
}
