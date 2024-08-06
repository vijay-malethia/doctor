// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_user/add_user_sheet.dart';
import '../ui/bottom_sheets/edit_appointment/edit_appointment_sheet.dart';
import '../ui/bottom_sheets/edit_user/edit_user_sheet.dart';

enum BottomSheetType {
  addUser,
  editAppointment,
  editUser,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.addUser: (context, request, completer) =>
        AddUser(request: request, completer: completer),
    BottomSheetType.editAppointment: (context, request, completer) =>
        EditAppointmentSheet(request: request, completer: completer),
    BottomSheetType.editUser: (context, request, completer) =>
        EditUserSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
