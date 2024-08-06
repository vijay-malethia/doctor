import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.bottomsheets.dart';
import '/app/app.dialogs.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/ui/common/theme.dart';
import '/ui/common/utils.dart';
import '/services/connectivity_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge)
      .catchError((err) {
    log('$err');
  });

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await setupLocator();

  // Combine setup functions if applicable
  setupDialogUi();
  setupBottomSheetUi();

  //Initilize internet connection
  ConnectivityService().initialize();

  // initialization
  runApp(const OpdSolution());
}

class OpdSolution extends StatelessWidget {
  const OpdSolution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: MaterialApp(
          title: 'OpdSolution',
          theme: activeTheme(),
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [StackedService.routeObserver]),
    );
  }
}
