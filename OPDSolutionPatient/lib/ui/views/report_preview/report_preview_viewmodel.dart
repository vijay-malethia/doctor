import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ReportPreviewViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

//navigation to go previous screen
  goBack() {
    _navigationService.back();
  }
}
