import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked.dart';
import 'dart:developer';

import '/services/index.dart';
import '/api/index.dart';
import '/app/app.locator.dart';
import '/app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final AppService _appService = locator<AppService>();

  bootstrapApp() async {
    try {
      await Future.wait(
        [
          _appService.bootstrap(),
          Future.delayed(const Duration(seconds: 1)),
        ],
      );

      if (_authService.isAuthorized) {
        _navigationService.clearStackAndShow(Routes.homeView);
      } else {
        _navigationService.clearStackAndShow(Routes.loginView);
      }
    } on ApiError catch (error) {
      log('Error$error');
    }
  }
}
