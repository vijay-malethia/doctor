import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.bottomsheets.dart';
import '/app/app.dialogs.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/ui/common/theme.dart';
import '/services/connectivity_service.dart';
import '/ui/common/widgets/dismisskeyboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  ConnectivityService().initialize();
  runApp(const OpdSolution());
}

class OpdSolution extends StatelessWidget {
  const OpdSolution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: MaterialApp(
          builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!),
          debugShowCheckedModeBanner: false,
          title: 'OPDSolution Patient',
          theme: activeTheme(),
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [StackedService.routeObserver]),
    );
  }
}
