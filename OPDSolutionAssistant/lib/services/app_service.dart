import '/api/index.dart';
import '/app/app.locator.dart';
import 'index.dart';

class AppService {
  final AuthService _authService = locator<AuthService>();

  Future bootstrap() async {
    initDio();
    await _authService.prepareUserSession();
    return true;
  }
}
