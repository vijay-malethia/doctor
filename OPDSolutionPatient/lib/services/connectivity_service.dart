import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:opdsolutionui/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class ConnectivityService {
  final NavigationService _navigationService = locator<NavigationService>();

  final connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  void initialize() {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      // Check the connectivity status and show the connectivity lost message if necessary.
      if (connectivityResult == ConnectivityResult.none) {
        _navigationService.navigateTo(Routes.connectivityView);
      } else {
        _navigationService.back();
      }
    });
  }

  void dispose() {
    connectivitySubscription.cancel();
  }
}
