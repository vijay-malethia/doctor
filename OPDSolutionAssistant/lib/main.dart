import 'package:doc_ease/services/connectivity_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

import '/app/app.bottomsheets.dart';
import '/app/app.dialogs.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';
import 'ui/common/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  ConnectivityService().initialize();
  runApp(const DocEase());
}

class DocEase extends StatelessWidget {
  const DocEase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocEase',
      theme: activeTheme(),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
