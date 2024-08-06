// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i13;
import 'package:flutter/material.dart';
import 'package:opd_doctor/model/medicine_model.dart' as _i14;
import 'package:opd_doctor/ui/views/doctor_profile/doctor_profile_view.dart'
    as _i7;
import 'package:opd_doctor/ui/views/home/home_view.dart' as _i2;
import 'package:opd_doctor/ui/views/list/list_view.dart' as _i8;
import 'package:opd_doctor/ui/views/login/login_view.dart' as _i5;
import 'package:opd_doctor/ui/views/otp/otp_view.dart' as _i6;
import 'package:opd_doctor/ui/views/patient/patient_view.dart' as _i4;
import 'package:opd_doctor/ui/views/print_view/print_view_view.dart' as _i12;
import 'package:opd_doctor/ui/views/report/report_view.dart' as _i9;
import 'package:opd_doctor/ui/views/search_user/search_user_view.dart' as _i11;
import 'package:opd_doctor/ui/views/startup/startup_view.dart' as _i3;
import 'package:opd_doctor/ui/views/user_profile/user_profile_view.dart'
    as _i10;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i15;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const patientView = '/patient-view';

  static const loginView = '/login-view';

  static const otpView = '/otp-view';

  static const doctorProfileView = '/doctor-profile-view';

  static const listView = '/list-view';

  static const reportView = '/report-view';

  static const userProfileView = '/user-profile-view';

  static const searchUserView = '/search-user-view';

  static const printViewView = '/print-view-view';

  static const all = <String>{
    homeView,
    startupView,
    patientView,
    loginView,
    otpView,
    doctorProfileView,
    listView,
    reportView,
    userProfileView,
    searchUserView,
    printViewView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.patientView,
      page: _i4.PatientView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i6.OtpView,
    ),
    _i1.RouteDef(
      Routes.doctorProfileView,
      page: _i7.DoctorProfileView,
    ),
    _i1.RouteDef(
      Routes.listView,
      page: _i8.ListView,
    ),
    _i1.RouteDef(
      Routes.reportView,
      page: _i9.ReportView,
    ),
    _i1.RouteDef(
      Routes.userProfileView,
      page: _i10.UserProfileView,
    ),
    _i1.RouteDef(
      Routes.searchUserView,
      page: _i11.SearchUserView,
    ),
    _i1.RouteDef(
      Routes.printViewView,
      page: _i12.PrintViewView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.PatientView: (data) {
      final args = data.getArgs<PatientViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.PatientView(
            userName: args.userName,
            age: args.age,
            gender: args.gender,
            phoneNumber: args.phoneNumber,
            id: args.id,
            appointId: args.appointId,
            key: args.key),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.OtpView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.OtpView(),
        settings: data,
      );
    },
    _i7.DoctorProfileView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DoctorProfileView(),
        settings: data,
      );
    },
    _i8.ListView: (data) {
      final args = data.getArgs<ListViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.ListView(name: args.name, key: args.key),
        settings: data,
      );
    },
    _i9.ReportView: (data) {
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ReportView(),
        settings: data,
      );
    },
    _i10.UserProfileView: (data) {
      final args = data.getArgs<UserProfileViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.UserProfileView(
            index: args.index, userList: args.userList, key: args.key),
        settings: data,
      );
    },
    _i11.SearchUserView: (data) {
      final args = data.getArgs<SearchUserViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.SearchUserView(userList: args.userList, key: args.key),
        settings: data,
      );
    },
    _i12.PrintViewView: (data) {
      final args = data.getArgs<PrintViewViewArguments>(nullOk: false);
      return _i13.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.PrintViewView(
            userName: args.userName,
            age: args.age,
            gender: args.gender,
            phoneNumber: args.phoneNumber,
            id: args.id,
            appointId: args.appointId,
            height: args.height,
            weight: args.weight,
            pulse: args.pulse,
            bp: args.bp,
            temperature: args.temperature,
            advice: args.advice,
            diagnosis: args.diagnosis,
            medicine: args.medicine,
            symptoms: args.symptoms,
            appointmentDate: args.appointmentDate,
            key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PatientViewArguments {
  const PatientViewArguments({
    required this.userName,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.id,
    required this.appointId,
    this.key,
  });

  final String? userName;

  final String? age;

  final String? gender;

  final String? phoneNumber;

  final String? id;

  final String? appointId;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"userName": "$userName", "age": "$age", "gender": "$gender", "phoneNumber": "$phoneNumber", "id": "$id", "appointId": "$appointId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PatientViewArguments other) {
    if (identical(this, other)) return true;
    return other.userName == userName &&
        other.age == age &&
        other.gender == gender &&
        other.phoneNumber == phoneNumber &&
        other.id == id &&
        other.appointId == appointId &&
        other.key == key;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        phoneNumber.hashCode ^
        id.hashCode ^
        appointId.hashCode ^
        key.hashCode;
  }
}

class ListViewArguments {
  const ListViewArguments({
    required this.name,
    this.key,
  });

  final String name;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"name": "$name", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ListViewArguments other) {
    if (identical(this, other)) return true;
    return other.name == name && other.key == key;
  }

  @override
  int get hashCode {
    return name.hashCode ^ key.hashCode;
  }
}

class UserProfileViewArguments {
  const UserProfileViewArguments({
    required this.index,
    required this.userList,
    this.key,
  });

  final int index;

  final List<dynamic> userList;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"index": "$index", "userList": "$userList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant UserProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.index == index &&
        other.userList == userList &&
        other.key == key;
  }

  @override
  int get hashCode {
    return index.hashCode ^ userList.hashCode ^ key.hashCode;
  }
}

class SearchUserViewArguments {
  const SearchUserViewArguments({
    required this.userList,
    this.key,
  });

  final List<dynamic> userList;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"userList": "$userList", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SearchUserViewArguments other) {
    if (identical(this, other)) return true;
    return other.userList == userList && other.key == key;
  }

  @override
  int get hashCode {
    return userList.hashCode ^ key.hashCode;
  }
}

class PrintViewViewArguments {
  const PrintViewViewArguments({
    required this.userName,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.id,
    required this.appointId,
    required this.height,
    required this.weight,
    required this.pulse,
    required this.bp,
    required this.temperature,
    required this.advice,
    required this.diagnosis,
    required this.medicine,
    required this.symptoms,
    required this.appointmentDate,
    this.key,
  });

  final String? userName;

  final String? age;

  final String? gender;

  final String? phoneNumber;

  final String? id;

  final String? appointId;

  final String? height;

  final String? weight;

  final String? pulse;

  final String? bp;

  final String? temperature;

  final String? advice;

  final List<dynamic> diagnosis;

  final List<_i14.MedicineModel> medicine;

  final List<dynamic> symptoms;

  final String? appointmentDate;

  final _i13.Key? key;

  @override
  String toString() {
    return '{"userName": "$userName", "age": "$age", "gender": "$gender", "phoneNumber": "$phoneNumber", "id": "$id", "appointId": "$appointId", "height": "$height", "weight": "$weight", "pulse": "$pulse", "bp": "$bp", "temperature": "$temperature", "advice": "$advice", "diagnosis": "$diagnosis", "medicine": "$medicine", "symptoms": "$symptoms", "appointmentDate": "$appointmentDate", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PrintViewViewArguments other) {
    if (identical(this, other)) return true;
    return other.userName == userName &&
        other.age == age &&
        other.gender == gender &&
        other.phoneNumber == phoneNumber &&
        other.id == id &&
        other.appointId == appointId &&
        other.height == height &&
        other.weight == weight &&
        other.pulse == pulse &&
        other.bp == bp &&
        other.temperature == temperature &&
        other.advice == advice &&
        other.diagnosis == diagnosis &&
        other.medicine == medicine &&
        other.symptoms == symptoms &&
        other.appointmentDate == appointmentDate &&
        other.key == key;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        phoneNumber.hashCode ^
        id.hashCode ^
        appointId.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        pulse.hashCode ^
        bp.hashCode ^
        temperature.hashCode ^
        advice.hashCode ^
        diagnosis.hashCode ^
        medicine.hashCode ^
        symptoms.hashCode ^
        appointmentDate.hashCode ^
        key.hashCode;
  }
}

extension NavigatorStateExtension on _i15.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPatientView({
    required String? userName,
    required String? age,
    required String? gender,
    required String? phoneNumber,
    required String? id,
    required String? appointId,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.patientView,
        arguments: PatientViewArguments(
            userName: userName,
            age: age,
            gender: gender,
            phoneNumber: phoneNumber,
            id: id,
            appointId: appointId,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDoctorProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.doctorProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListView({
    required String name,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.listView,
        arguments: ListViewArguments(name: name, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserProfileView({
    required int index,
    required List<dynamic> userList,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userProfileView,
        arguments: UserProfileViewArguments(
            index: index, userList: userList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchUserView({
    required List<dynamic> userList,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.searchUserView,
        arguments: SearchUserViewArguments(userList: userList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrintViewView({
    required String? userName,
    required String? age,
    required String? gender,
    required String? phoneNumber,
    required String? id,
    required String? appointId,
    required String? height,
    required String? weight,
    required String? pulse,
    required String? bp,
    required String? temperature,
    required String? advice,
    required List<dynamic> diagnosis,
    required List<_i14.MedicineModel> medicine,
    required List<dynamic> symptoms,
    required String? appointmentDate,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.printViewView,
        arguments: PrintViewViewArguments(
            userName: userName,
            age: age,
            gender: gender,
            phoneNumber: phoneNumber,
            id: id,
            appointId: appointId,
            height: height,
            weight: weight,
            pulse: pulse,
            bp: bp,
            temperature: temperature,
            advice: advice,
            diagnosis: diagnosis,
            medicine: medicine,
            symptoms: symptoms,
            appointmentDate: appointmentDate,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPatientView({
    required String? userName,
    required String? age,
    required String? gender,
    required String? phoneNumber,
    required String? id,
    required String? appointId,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.patientView,
        arguments: PatientViewArguments(
            userName: userName,
            age: age,
            gender: gender,
            phoneNumber: phoneNumber,
            id: id,
            appointId: appointId,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDoctorProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.doctorProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListView({
    required String name,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.listView,
        arguments: ListViewArguments(name: name, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserProfileView({
    required int index,
    required List<dynamic> userList,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userProfileView,
        arguments: UserProfileViewArguments(
            index: index, userList: userList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchUserView({
    required List<dynamic> userList,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.searchUserView,
        arguments: SearchUserViewArguments(userList: userList, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPrintViewView({
    required String? userName,
    required String? age,
    required String? gender,
    required String? phoneNumber,
    required String? id,
    required String? appointId,
    required String? height,
    required String? weight,
    required String? pulse,
    required String? bp,
    required String? temperature,
    required String? advice,
    required List<dynamic> diagnosis,
    required List<_i14.MedicineModel> medicine,
    required List<dynamic> symptoms,
    required String? appointmentDate,
    _i13.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.printViewView,
        arguments: PrintViewViewArguments(
            userName: userName,
            age: age,
            gender: gender,
            phoneNumber: phoneNumber,
            id: id,
            appointId: appointId,
            height: height,
            weight: weight,
            pulse: pulse,
            bp: bp,
            temperature: temperature,
            advice: advice,
            diagnosis: diagnosis,
            medicine: medicine,
            symptoms: symptoms,
            appointmentDate: appointmentDate,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
