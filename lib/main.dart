import 'package:bds_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:bancolombia_foundations/bancolombia_foundations.dart';
import 'package:bds_mobile/foundations/foundations.dart';

import 'package:bc_appcenter_plugin/bc_appcenter_plugin.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import 'app/app.dart';
import 'utils/bc_super_app_provider_bds.dart';

Future<void> main() async {
  final BcThemeNotifier themeNotifier = BcThemeNotifier();

  final List<SingleChildWidget> itemsProviders = <SingleChildWidget>[
    ChangeNotifierProvider(create: (_) => themeNotifier),
    ...BancolombiaFoundations.themeProvider,
    ChangeNotifierProvider(create: (_) => BcSuperAppProviderBds()),
  ];

  WidgetsFlutterBinding.ensureInitialized();
  await themeNotifier.getSystemPreferences();
  final BcAppConfig configuredApp = Setup.getApp(
    providers: itemsProviders,
  ); 

  if (!kDebugMode && !kIsWeb) {
    await BcAppCenterPlugin.startAsync(
      '96b0ec01-1b84-4e1c-873a-3db2ed2fe96b',
      '6ca42bcd-7bce-4e1f-bd55-b1edca53260c',
      enableAnalytics: true,
      enableCrashes: true,
      enableDistribute: true,
    );

    await BcAppCenterPlugin.configureDistributeAsync(enabled: true);
  }

  runApp(
        DevicePreview(
          enabled: false,
          builder: (context) => configuredApp,
        ), 
  );
}

class Setup {
  static BcAppConfig getApp({
    required List<SingleChildWidget> providers,
  }) {
    const String baseUrl = '';
    const String apiCaptchaUrl = '';
    return BcAppConfig(
      appName: 'UdeA',
      apiBaseUrl: baseUrl,
      apiCaptchaUrl: '$apiCaptchaUrl/1.0.9/captcha/balm-captcha-google-v3.html',
      environment: BcEnvironment.Mock,
      channel: BcChannel.BLM,
      apiKeyUnleash: '',
      apiUnleashUrl: '',
      encryptedKeyUrl: '',
      child: MultiProvider(
        providers: providers,
        child: const riverpod.ProviderScope(
          child: MyAppShowcase(), 
        )
      ),
    );
  }
}


