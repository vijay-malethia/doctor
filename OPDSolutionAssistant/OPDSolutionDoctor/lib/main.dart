import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opd_doctor/ui/common/utils.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:opd_doctor/app/app.bottomsheets.dart';
import 'package:opd_doctor/app/app.dialogs.dart';
import 'package:opd_doctor/app/app.locator.dart';
import 'package:opd_doctor/app/app.router.dart';
import 'package:opd_doctor/ui/common/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge)
      .catchError((err) {
    log('$err');
  });
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(),
      child: MaterialApp(
        theme: activeTheme(),
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
      ),
    );
  }
}
