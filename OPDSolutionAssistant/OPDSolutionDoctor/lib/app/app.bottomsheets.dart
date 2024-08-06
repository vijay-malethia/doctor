// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_diagnosis/add_diagnosis_sheet.dart';
import '../ui/bottom_sheets/add_medicines/add_medicines_sheet.dart';
import '../ui/bottom_sheets/add_new_user/add_new_user_sheet.dart';
import '../ui/bottom_sheets/add_reports/add_reports_sheet.dart';
import '../ui/bottom_sheets/add_symptom/add_symptom_sheet.dart';
import '../ui/bottom_sheets/edit_assistant/edit_assistant_sheet.dart';
import '../ui/bottom_sheets/edit_clinic/edit_clinic_sheet.dart';
import '../ui/bottom_sheets/edit_doctor_profile/edit_doctor_profile_sheet.dart';
import '../ui/bottom_sheets/edit_user_profile/edit_user_profile_sheet.dart';
import '../ui/bottom_sheets/edit_vitals/edit_vitals_sheet.dart';
import '../ui/bottom_sheets/edit_working_hour/edit_working_hour_sheet.dart';
import '../ui/bottom_sheets/image_picker/image_picker_sheet.dart';

enum BottomSheetType {
  editDoctorProfile,
  editAssistant,
  editClinic,
  editVitals,
  editUserProfile,
  addNewUser,
  addSymptom,
  addDiagnosis,
  addReports,
  addMedicines,
  editWorkingHour,
  imagePicker,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.editDoctorProfile: (context, request, completer) =>
        EditDoctorProfileSheet(request: request, completer: completer),
    BottomSheetType.editAssistant: (context, request, completer) =>
        EditAssistantSheet(request: request, completer: completer),
    BottomSheetType.editClinic: (context, request, completer) =>
        EditClinicSheet(request: request, completer: completer),
    BottomSheetType.editVitals: (context, request, completer) =>
        EditVitalsSheet(request: request, completer: completer),
    BottomSheetType.editUserProfile: (context, request, completer) =>
        EditUserProfileSheet(request: request, completer: completer),
    BottomSheetType.addNewUser: (context, request, completer) =>
        AddNewUserSheet(request: request, completer: completer),
    BottomSheetType.addSymptom: (context, request, completer) =>
        AddSymptomSheet(request: request, completer: completer),
    BottomSheetType.addDiagnosis: (context, request, completer) =>
        AddDiagnosisSheet(request: request, completer: completer),
    BottomSheetType.addReports: (context, request, completer) =>
        AddReportsSheet(request: request, completer: completer),
    BottomSheetType.addMedicines: (context, request, completer) =>
        AddMedicinesSheet(request: request, completer: completer),
    BottomSheetType.editWorkingHour: (context, request, completer) =>
        EditWorkingHourSheet(request: request, completer: completer),
    BottomSheetType.imagePicker: (context, request, completer) =>
        ImagePickerSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
