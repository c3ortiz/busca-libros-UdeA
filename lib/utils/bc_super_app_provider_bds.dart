import 'package:flutter/material.dart';

class BcSuperAppProviderBds extends ChangeNotifier {
  bool _isCalledBySuperApp = false;

  bool get isCalledBySuperApp => _isCalledBySuperApp;

  set isCalledBySuperApp(bool isCalled) {
    Future.delayed(Duration.zero, () {
      _isCalledBySuperApp = isCalled;
      notifyListeners();
    });
  }
}