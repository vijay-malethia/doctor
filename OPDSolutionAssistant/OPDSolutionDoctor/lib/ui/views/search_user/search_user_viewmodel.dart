import 'package:stacked/stacked.dart';

import '../../../api/api_error.dart';
import '../../../app/app.locator.dart';
import '../../../services/user_service.dart';

class SearchUserViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();
  List searchList = [];

  //Users Icons
  List logoList = [
    'assets/images/patientLogo.svg',
    'assets/images/patientLogoGreen.svg',
    'assets/images/patientLogoYellow.svg',
    'assets/images/patientLogoPurple.svg',
    'assets/images/patientLogoRed.svg'
  ];

  //////////////////////////////////////////////////////////////////////////Api Work//////////////////////////////////////////////////////////////////////////////////////

  //Search User By Number
  void searchNumber(number) async {
    if (number.isEmpty) {
      searchList.clear();
      notifyListeners();
      return;
    }
    try {
      var res = await _userService.searchUser(number);
      searchList = res.data;
      notifyListeners();
    } on ApiError catch (error) {
      (error);
    } finally {}
  }
}
