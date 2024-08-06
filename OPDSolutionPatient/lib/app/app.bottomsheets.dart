// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_user/add_user_sheet.dart';
import '../ui/bottom_sheets/edit_patien_vitals/edit_patien_vitals_sheet.dart';
import '../ui/bottom_sheets/edit_patient_profile/edit_patient_profile_sheet.dart';
import '../ui/bottom_sheets/image_picker_bottom_sheet/image_picker_bottom_sheet_sheet.dart';
import '../ui/bottom_sheets/switch_user/switch_user_sheet.dart';
import '../ui/bottom_sheets/upload_options/upload_options_sheet.dart';

enum BottomSheetType {
  imagePickerBottomSheet,
  uploadOptions,
  editPatientProfile,
  editPatienVitals,
  switchUser,
  addUser,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.imagePickerBottomSheet: (context, request, completer) =>
        ImagePickerBottomSheetSheet(request: request, completer: completer),
    BottomSheetType.uploadOptions: (context, request, completer) =>
        UploadOptionsSheet(request: request, completer: completer),
    BottomSheetType.editPatientProfile: (context, request, completer) =>
        EditPatientProfileSheet(request: request, completer: completer),
    BottomSheetType.editPatienVitals: (context, request, completer) =>
        EditPatienVitalsSheet(request: request, completer: completer),
    BottomSheetType.switchUser: (context, request, completer) =>
        SwitchUserSheet(request: request, completer: completer),
    BottomSheetType.addUser: (context, request, completer) =>
        AddUserSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
