import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '/ui/bottom_sheets/add_user/add_user_sheet.dart';
import '/services/index.dart';
import '/ui/dialogs/info_alert/info_alert_dialog.dart';
import '/ui/views/home/home_view.dart';
import '/ui/views/startup/startup_view.dart';
import '/ui/views/login/login_view.dart';
import '/ui/views/otp/otp_view.dart';
import '/ui/views/appointment_details/appointment_details_view.dart';
import '/ui/bottom_sheets/edit_appointment/edit_appointment_sheet.dart';
import '/ui/views/search_user/search_user_view.dart';
import '/ui/views/user_detail/user_detail_view.dart';
import 'package:doc_ease/ui/bottom_sheets/edit_user/edit_user_sheet.dart';
import 'package:doc_ease/services/connectivity_service.dart';
import 'package:doc_ease/ui/views/connectivity/connectivity_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: AppointmentDetailsView),
    MaterialRoute(page: SearchUserView),
    MaterialRoute(page: UserDetailView),
    MaterialRoute(page: ConnectivityView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: AppService),
    LazySingleton(classType: HomeService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: ConnectivityService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AddUser),
    StackedBottomsheet(classType: EditAppointmentSheet),
    StackedBottomsheet(classType: EditUserSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
