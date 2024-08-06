import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.locator.dart';

class MedicinesViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  //Go to back
  goToBack() {
    _navigationService.back();
  }
}
