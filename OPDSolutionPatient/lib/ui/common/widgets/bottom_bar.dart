import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '/app/app.router.dart';
import '/app/app.locator.dart';

int currentIndex = 0;

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  BottomNavigation({this.currentIndex = 0, super.key});
  final NavigationService _navigationService = locator<NavigationService>();

  bool isItAlreadyOnTab(index, currentIndex, tabIndex) {
    return index == tabIndex && currentIndex != tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (isItAlreadyOnTab(index, currentIndex, 0)) {
            _navigationService.clearStackAndShow(Routes.homeView);
          } else if (isItAlreadyOnTab(index, currentIndex, 1)) {
            _navigationService.clearTillFirstAndShow(Routes.historyView);
          } else if (isItAlreadyOnTab(index, currentIndex, 2)) {
            _navigationService.clearTillFirstAndShow(Routes.profileView);
          }
        },
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: "My Book Slot",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: "History",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
              backgroundColor: Colors.white)
        ]);
  }
}
