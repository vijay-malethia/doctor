import 'package:flutter/material.dart';

void dismissKeyboard([BuildContext? context]) {
  if (context != null) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  } else {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
