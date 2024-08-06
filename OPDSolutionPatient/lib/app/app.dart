import '/ui/dialogs/info_alert/info_alert_dialog.dart';
import '/ui/views/home/home_view.dart';
import '/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '/ui/views/auth/auth_view.dart';
import '../ui/views/auth/otp/otp_view.dart';
import '/services/app_service.dart';
import '/services/auth_service.dart';
import '/services/patient_service.dart';
import 'package:opdsolutionui/ui/views/doctor/doctor_view.dart';
import 'package:opdsolutionui/ui/views/profile/profile_view.dart';
import 'package:opdsolutionui/ui/views/edit_profile/edit_profile_view.dart';
import 'package:opdsolutionui/ui/views/report/report_view.dart';
import 'package:opdsolutionui/ui/views/report_preview/report_preview_view.dart';
import 'package:opdsolutionui/ui/bottom_sheets/image_picker_bottom_sheet/image_picker_bottom_sheet_sheet.dart';
import 'package:opdsolutionui/ui/bottom_sheets/upload_options/upload_options_sheet.dart';
import 'package:opdsolutionui/ui/views/connectivity/connectivity_view.dart';
import 'package:opdsolutionui/services/connectivity_service.dart';
import 'package:opdsolutionui/ui/views/auth/sign_up/sign_up_view.dart';
import 'package:opdsolutionui/ui/views/medicines/medicines_view.dart';
import 'package:opdsolutionui/ui/views/history/history_view.dart';
import 'package:opdsolutionui/ui/bottom_sheets/edit_patient_profile/edit_patient_profile_sheet.dart';
import 'package:opdsolutionui/ui/bottom_sheets/edit_patien_vitals/edit_patien_vitals_sheet.dart';
import 'package:opdsolutionui/ui/bottom_sheets/switch_user/switch_user_sheet.dart';
import 'package:opdsolutionui/ui/bottom_sheets/add_user/add_user_sheet.dart';

import 'package:opdsolutionui/ui/views/history_upload/history_upload_view.dart';
import 'package:opdsolutionui/ui/views/preview/preview_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: DoctorView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: ReportView),
    MaterialRoute(page: ReportPreviewView),
    MaterialRoute(page: ConnectivityView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: MedicinesView),
    MaterialRoute(page: HistoryView),

    MaterialRoute(page: HistoryUploadView),
    MaterialRoute(page: PreviewView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AppService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: PatientService),
    LazySingleton(classType: ConnectivityService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: ImagePickerBottomSheetSheet),
    StackedBottomsheet(classType: UploadOptionsSheet),
    StackedBottomsheet(classType: EditPatientProfileSheet),
    StackedBottomsheet(classType: EditPatienVitalsSheet),
    StackedBottomsheet(classType: SwitchUserSheet),
    StackedBottomsheet(classType: AddUserSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
