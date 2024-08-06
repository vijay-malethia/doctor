import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
 int selectedindex = 0;
class PreviewViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  ScrollController scrollController = ScrollController();
  late PageController pageController =
      PageController(initialPage: selectedindex);
  var previewData;
  //init function
  init(result, id) {
    previewData = result; //get argument result data in this
    for (var index = 0; index < previewData.length; index++) {
      // for (var i = 0; i < previewData[index]['reports'].length; i++) {
      if (previewData[index]['reportId'] == id) {
        selectedindex = index;
        break;
        // }
      }
    }

    notifyListeners();
  }

  bool showgrid = true;

  showGrid() {
    showgrid = !showgrid;
    notifyListeners();
  }

 
  slectedImage(index) {
    selectedindex = index;
    notifyListeners();
  }

  //Navigate back
  goBack() {
    _navigationService.back();
  }

//for previous and next image
  // changeImg(bool isprevious) {
  //   if (selectedindex >= 0) {
  //     if (isprevious && selectedindex != 0) {
  //       selectedindex = selectedindex - 1;
  //     } else if (!isprevious && selectedindex != previewData.length - 1) {
  //       selectedindex = selectedindex + 1;
  //     }
  //   }
  //   notifyListeners();
  // }

  void update(int newIndex) {
    // Calculate the new scroll position based on the selected index and item width
    double newScrollPosition = newIndex * 60.0;

    // Scroll the ListView.builder to the new position
    scrollController.animateTo(
      newScrollPosition,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );

    selectedindex = newIndex;
    notifyListeners();
  }
}
