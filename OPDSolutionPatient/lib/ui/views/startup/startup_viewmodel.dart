import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.locator.dart';
import '/app/app.router.dart';
import '/services/app_service.dart';
import '/services/auth_service.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AppService _appService = locator<AppService>();
  final AuthService _authService = locator<AuthService>();

  //Check user is authorized or not
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
        _navigationService.clearStackAndShow(Routes.authView);
      }
    } on Error catch (error) {
      log('Error: $error');
    }
  }
}
