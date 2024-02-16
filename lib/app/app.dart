import 'package:bancolombia_foundations/bancolombia_foundations.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

import '../config/providers/book_data_provider.dart';
import '../config/routes/app_routes.dart';
import '../ui/pages/home_page.dart';
import '../utils/bc_theme_model.dart';

class MyAppShowcase extends ConsumerWidget {
  const MyAppShowcase({super.key});

  static Future changeThemeOnWeb(
    bool isDark,
    BcThemeNotifier bcThemeNotifier,
  ) async {
    if (!isDark) {
      await bcThemeNotifier.setThemeMode(ThemeMode.light);
    } else {
      await bcThemeNotifier.setThemeMode(ThemeMode.dark);
    }
  }

  static Future<void> changeTheme(BcThemeModel model) async {
    if (!model.isCalled) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await MyAppShowcase.changeThemeOnWeb(
          model.isDark,
          model.bcThemeNotifier!,
        );
        model.isCalled = true;
        model.setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = context.watch<BcThemeNotifier>();

    return MaterialApp(
      showSemanticsDebugger: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      title: 'UdeA',
      theme: BcThemeData.lightTheme,
      darkTheme: BcThemeData.darkTheme,
      themeMode: appTheme.getThemeMode(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case (AppRoutes.homePage):
            return MaterialPageRoute(
              builder: ((context) => HomePage(
                bookDetailList: ref.watch(bookDataProvider).getBookData()
              ))
            );
          default:
            return MaterialPageRoute(builder: ((context) => HomePage(
                bookDetailList: ref.watch(bookDataProvider).getBookData()
              )));
        }
      },
    );
  }
}