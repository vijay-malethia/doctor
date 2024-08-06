import 'package:stacked/stacked.dart';

class SharedService with ListenableServiceMixin {
  SharedService() {
    listenToReactiveValues([]);
  }

  Future<bool> prepareUserInfo() async {
    return true;
  }
}
