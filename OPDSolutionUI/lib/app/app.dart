import '../ui/views/symptom/symptom_view.dart';
import '/ui/dialogs/info_alert/info_alert_dialog.dart';
import '/ui/views/home/home_view.dart';
import '/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '/ui/views/auth/auth_view.dart';
import '../ui/views/auth/otp/otp_view.dart';
import '/ui/views/consultation/consultation_view.dart';
import '/ui/views/print/print_view.dart';
import '/services/shared_service.dart';
import '/services/app_service.dart';
import '/services/auth_service.dart';
import '/services/consultation_service.dart';
import 'package:opdsolutionui/ui/bottom_sheets/select_item/select_item_sheet.dart';
import 'package:opdsolutionui/ui/bottom_sheets/add_diagnosis/add_diagnosis_sheet.dart';
import 'package:opdsolutionui/ui/bottom_sheets/add_report/add_report_sheet.dart';
import 'package:opdsolutionui/ui/bottom_sheets/add_medicine/add_medicine_sheet.dart';
import 'package:opdsolutionui/services/connectivity_service.dart';
import 'package:opdsolutionui/ui/views/connectivity/connectivity_view.dart';
import 'package:opdsolutionui/ui/views/report/report_view.dart';

import 'package:opdsolutionui/ui/views/medicine/medicine_view.dart';
import 'package:opdsolutionui/ui/views/all_reports/all_reports_view.dart';
import 'package:opdsolutionui/ui/views/diagnosis/diagnosis_view.dart';
import 'package:opdsolutionui/ui/dialogs/add_item/add_item_dialog.dart';
import 'package:opdsolutionui/ui/views/profile/profile_view.dart';

import 'package:opdsolutionui/ui/bottom_sheets/image_picker/image_picker_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: ConsultationView),
    MaterialRoute(page: PrintView),
    MaterialRoute(page: ConnectivityView),
    MaterialRoute(page: ReportView),
    MaterialRoute(page: SymptomsView),
    MaterialRoute(page: MedicineView),
    MaterialRoute(page: AllReportsView),
    MaterialRoute(page: DiagnosisView),
    MaterialRoute(page: ProfileView),

// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SharedService),
    LazySingleton(classType: AppService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ConsultationService),
    LazySingleton(classType: ConnectivityService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: SelectItemSheet),
    StackedBottomsheet(classType: AddDiagnosisSheet),
    StackedBottomsheet(classType: AddReportSheet),
    StackedBottomsheet(classType: AddMedicineSheet),
    StackedBottomsheet(classType: ImagePickerSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: AddItemDialog),
// @stacked-dialog
  ],
)
class App {}
