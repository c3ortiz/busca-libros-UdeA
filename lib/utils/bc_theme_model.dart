import 'dart:ui';

import 'package:bds_mobile/foundations/foundations.dart';

class BcThemeModel {
  BcThemeModel(this.isCalled, this.bcThemeNotifier, this.setState, this.isDark);

  bool isDark;
  bool isCalled;
  BcThemeNotifier? bcThemeNotifier;
  Function(VoidCallback fn) setState;
}