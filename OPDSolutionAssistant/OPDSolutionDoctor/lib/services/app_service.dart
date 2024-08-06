import 'package:opd_doctor/services/shared_service.dart';

import '../api/index.dart';
import '/app/app.locator.dart';
import 'auth_service.dart';

class AppService {
  final AuthService _authService = locator<AuthService>();
  final SharedService _sharedService = locator<SharedService>();

  Future bootstrap() async {
    // Initial dio instance
    initDio();
    await _authService.prepareUserSession();
    if (_authService.isAuthorized) {
      await _sharedService.prepareUserInfo();
    }
    return true;
  }
}
