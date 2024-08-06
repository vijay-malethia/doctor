import '../api/http_request.dart';
import '/app/app.locator.dart';

import 'index_service.dart';

class AppService {
  final AuthService _authService = locator<AuthService>();

  Future bootstrap() async {
    // Initial dio instance
    initDio();
    await _authService.prepareUserSession();
    if (_authService.isAuthorized) {}
    return true;
  }
}
