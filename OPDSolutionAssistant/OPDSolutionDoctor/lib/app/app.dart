import 'package:opd_doctor/ui/views/home/home_view.dart';
import 'package:opd_doctor/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:opd_doctor/services/app_service.dart';
import 'package:opd_doctor/services/auth_service.dart';
import 'package:opd_doctor/services/user_service.dart';
import 'package:opd_doctor/ui/views/patient/patient_view.dart';
import 'package:opd_doctor/ui/views/login/login_view.dart';
import 'package:opd_doctor/ui/views/otp/otp_view.dart';
import 'package:opd_doctor/services/shared_service.dart';
import 'package:opd_doctor/ui/views/doctor_profile/doctor_profile_view.dart';

import 'package:opd_doctor/ui/views/list/list_view.dart';
import 'package:opd_doctor/ui/dialogs/add_new/add_new_dialog.dart';
import 'package:opd_doctor/ui/bottom_sheets/edit_doctor_profile/edit_doctor_profile_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/edit_assistant/edit_assistant_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/edit_clinic/edit_clinic_sheet.dart';
import 'package:opd_doctor/ui/views/user_profile/user_profile_view.dart';
import 'package:opd_doctor/ui/views/search_user/search_user_view.dart';
import 'package:opd_doctor/ui/bottom_sheets/edit_vitals/edit_vitals_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/edit_user_profile/edit_user_profile_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/add_new_user/add_new_user_sheet.dart';
import 'package:opd_doctor/ui/dialogs/confirm/confirm_dialog.dart';
import 'package:opd_doctor/ui/bottom_sheets/add_symptom/add_symptom_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/add_diagnosis/add_diagnosis_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/add_reports/add_reports_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/add_medicines/add_medicines_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/edit_working_hour/edit_working_hour_sheet.dart';
import 'package:opd_doctor/ui/bottom_sheets/image_picker/image_picker_sheet.dart';
import 'package:opd_doctor/ui/views/report/report_view.dart';
import 'package:opd_doctor/ui/views/print_view/print_view_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: PatientView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: DoctorProfileView),

    MaterialRoute(page: ListView),
    MaterialRoute(page: ReportView),
    MaterialRoute(page: UserProfileView),
    MaterialRoute(page: SearchUserView),
    MaterialRoute(page: PrintViewView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AppService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: SharedService)

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: EditDoctorProfileSheet),
    StackedBottomsheet(classType: EditAssistantSheet),
    StackedBottomsheet(classType: EditClinicSheet),
    StackedBottomsheet(classType: EditVitalsSheet),
    StackedBottomsheet(classType: EditUserProfileSheet),
    StackedBottomsheet(classType: AddNewUserSheet),
    StackedBottomsheet(classType: AddSymptomSheet),
    StackedBottomsheet(classType: AddDiagnosisSheet),
    StackedBottomsheet(classType: AddReportsSheet),
    StackedBottomsheet(classType: AddMedicinesSheet),
    StackedBottomsheet(classType: EditWorkingHourSheet),
    StackedBottomsheet(classType: ImagePickerSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: AddNewDialog),
    StackedDialog(classType: ConfirmDialog),
// @stacked-dialog
  ],
)
class App {}
