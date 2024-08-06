// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:opdsolutionui/model/medicine_model.dart' as _i16;
import 'package:opdsolutionui/ui/views/all_reports/all_reports_view.dart'
    as _i12;
import 'package:opdsolutionui/ui/views/auth/auth_view.dart' as _i4;
import 'package:opdsolutionui/ui/views/auth/otp/otp_view.dart' as _i5;
import 'package:opdsolutionui/ui/views/connectivity/connectivity_view.dart'
    as _i8;
import 'package:opdsolutionui/ui/views/consultation/consultation_view.dart'
    as _i6;
import 'package:opdsolutionui/ui/views/diagnosis/diagnosis_view.dart' as _i13;
import 'package:opdsolutionui/ui/views/home/home_view.dart' as _i2;
import 'package:opdsolutionui/ui/views/medicine/medicine_view.dart' as _i11;
import 'package:opdsolutionui/ui/views/print/print_view.dart' as _i7;
import 'package:opdsolutionui/ui/views/profile/profile_view.dart' as _i14;
import 'package:opdsolutionui/ui/views/report/report_view.dart' as _i9;
import 'package:opdsolutionui/ui/views/startup/startup_view.dart' as _i3;
import 'package:opdsolutionui/ui/views/symptom/symptom_view.dart' as _i10;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const authView = '/auth-view';

  static const otpView = '/otp-view';

  static const consultationView = '/consultation-view';

  static const printView = '/print-view';

  static const connectivityView = '/connectivity-view';

  static const reportView = '/report-view';

  static const symptomsView = '/symptoms-view';

  static const medicineView = '/medicine-view';

  static const allReportsView = '/all-reports-view';

  static const diagnosisView = '/diagnosis-view';

  static const profileView = '/profile-view';

  static const all = <String>{
    homeView,
    startupView,
    authView,
    otpView,
    consultationView,
    printView,
    connectivityView,
    reportView,
    symptomsView,
    medicineView,
    allReportsView,
    diagnosisView,
    profileView,
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
      Routes.authView,
      page: _i4.AuthView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i5.OtpView,
    ),
    _i1.RouteDef(
      Routes.consultationView,
      page: _i6.ConsultationView,
    ),
    _i1.RouteDef(
      Routes.printView,
      page: _i7.PrintView,
    ),
    _i1.RouteDef(
      Routes.connectivityView,
      page: _i8.ConnectivityView,
    ),
    _i1.RouteDef(
      Routes.reportView,
      page: _i9.ReportView,
    ),
    _i1.RouteDef(
      Routes.symptomsView,
      page: _i10.SymptomsView,
    ),
    _i1.RouteDef(
      Routes.medicineView,
      page: _i11.MedicineView,
    ),
    _i1.RouteDef(
      Routes.allReportsView,
      page: _i12.AllReportsView,
    ),
    _i1.RouteDef(
      Routes.diagnosisView,
      page: _i13.DiagnosisView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i14.ProfileView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.AuthView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AuthView(),
        settings: data,
      );
    },
    _i5.OtpView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OtpView(),
        settings: data,
      );
    },
    _i6.ConsultationView: (data) {
      final args = data.getArgs<ConsultationViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ConsultationView(
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
    _i7.PrintView: (data) {
      final args = data.getArgs<PrintViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.PrintView(
            key: args.key,
            advice: args.advice,
            reports: args.reports,
            age: args.age,
            bp: args.bp,
            complaints: args.complaints,
            diagnosis: args.diagnosis,
            gender: args.gender,
            height: args.height,
            medicine: args.medicine,
            phoneNumber: args.phoneNumber,
            userName: args.userName,
            weight: args.weight,
            doctor: args.doctor,
            number: args.number,
            pulse: args.pulse,
            temperature: args.temperature,
            activeStep: args.activeStep,
            specialization: args.specialization),
        settings: data,
      );
    },
    _i8.ConnectivityView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ConnectivityView(),
        settings: data,
      );
    },
    _i9.ReportView: (data) {
      final args = data.getArgs<ReportViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ReportView(
            reportUrl: args.reportUrl,
            reportName: args.reportName,
            key: args.key),
        settings: data,
      );
    },
    _i10.SymptomsView: (data) {
      final args = data.getArgs<SymptomsViewArguments>(
        orElse: () => const SymptomsViewArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.SymptomsView(key: args.key),
        settings: data,
      );
    },
    _i11.MedicineView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.MedicineView(),
        settings: data,
      );
    },
    _i12.AllReportsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.AllReportsView(),
        settings: data,
      );
    },
    _i13.DiagnosisView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.DiagnosisView(),
        settings: data,
      );
    },
    _i14.ProfileView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ProfileView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ConsultationViewArguments {
  const ConsultationViewArguments({
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

  final _i15.Key? key;

  @override
  String toString() {
    return '{"userName": "$userName", "age": "$age", "gender": "$gender", "phoneNumber": "$phoneNumber", "id": "$id", "appointId": "$appointId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ConsultationViewArguments other) {
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

class PrintViewArguments {
  const PrintViewArguments({
    this.key,
    required this.advice,
    required this.reports,
    required this.age,
    required this.bp,
    required this.complaints,
    required this.diagnosis,
    required this.gender,
    required this.height,
    required this.medicine,
    required this.phoneNumber,
    required this.userName,
    required this.weight,
    required this.doctor,
    required this.number,
    required this.pulse,
    required this.temperature,
    required this.activeStep,
    required this.specialization,
  });

  final _i15.Key? key;

  final String? advice;

  final String? reports;

  final String? age;

  final String? bp;

  final String? complaints;

  final String? diagnosis;

  final String? gender;

  final String? height;

  final List<_i16.MedicineModel> medicine;

  final String? phoneNumber;

  final String? userName;

  final String? weight;

  final String? doctor;

  final String? number;

  final String? pulse;

  final String? temperature;

  final String? activeStep;

  final String? specialization;

  @override
  String toString() {
    return '{"key": "$key", "advice": "$advice", "reports": "$reports", "age": "$age", "bp": "$bp", "complaints": "$complaints", "diagnosis": "$diagnosis", "gender": "$gender", "height": "$height", "medicine": "$medicine", "phoneNumber": "$phoneNumber", "userName": "$userName", "weight": "$weight", "doctor": "$doctor", "number": "$number", "pulse": "$pulse", "temperature": "$temperature", "activeStep": "$activeStep", "specialization": "$specialization"}';
  }

  @override
  bool operator ==(covariant PrintViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.advice == advice &&
        other.reports == reports &&
        other.age == age &&
        other.bp == bp &&
        other.complaints == complaints &&
        other.diagnosis == diagnosis &&
        other.gender == gender &&
        other.height == height &&
        other.medicine == medicine &&
        other.phoneNumber == phoneNumber &&
        other.userName == userName &&
        other.weight == weight &&
        other.doctor == doctor &&
        other.number == number &&
        other.pulse == pulse &&
        other.temperature == temperature &&
        other.activeStep == activeStep &&
        other.specialization == specialization;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        advice.hashCode ^
        reports.hashCode ^
        age.hashCode ^
        bp.hashCode ^
        complaints.hashCode ^
        diagnosis.hashCode ^
        gender.hashCode ^
        height.hashCode ^
        medicine.hashCode ^
        phoneNumber.hashCode ^
        userName.hashCode ^
        weight.hashCode ^
        doctor.hashCode ^
        number.hashCode ^
        pulse.hashCode ^
        temperature.hashCode ^
        activeStep.hashCode ^
        specialization.hashCode;
  }
}

class ReportViewArguments {
  const ReportViewArguments({
    required this.reportUrl,
    required this.reportName,
    this.key,
  });

  final String reportUrl;

  final String reportName;

  final _i15.Key? key;

  @override
  String toString() {
    return '{"reportUrl": "$reportUrl", "reportName": "$reportName", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ReportViewArguments other) {
    if (identical(this, other)) return true;
    return other.reportUrl == reportUrl &&
        other.reportName == reportName &&
        other.key == key;
  }

  @override
  int get hashCode {
    return reportUrl.hashCode ^ reportName.hashCode ^ key.hashCode;
  }
}

class SymptomsViewArguments {
  const SymptomsViewArguments({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SymptomsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i17.NavigationService {
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

  Future<dynamic> navigateToAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authView,
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

  Future<dynamic> navigateToConsultationView({
    required String? userName,
    required String? age,
    required String? gender,
    required String? phoneNumber,
    required String? id,
    required String? appointId,
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.consultationView,
        arguments: ConsultationViewArguments(
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

  Future<dynamic> navigateToPrintView({
    _i15.Key? key,
    required String? advice,
    required String? reports,
    required String? age,
    required String? bp,
    required String? complaints,
    required String? diagnosis,
    required String? gender,
    required String? height,
    required List<_i16.MedicineModel> medicine,
    required String? phoneNumber,
    required String? userName,
    required String? weight,
    required String? doctor,
    required String? number,
    required String? pulse,
    required String? temperature,
    required String? activeStep,
    required String? specialization,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.printView,
        arguments: PrintViewArguments(
            key: key,
            advice: advice,
            reports: reports,
            age: age,
            bp: bp,
            complaints: complaints,
            diagnosis: diagnosis,
            gender: gender,
            height: height,
            medicine: medicine,
            phoneNumber: phoneNumber,
            userName: userName,
            weight: weight,
            doctor: doctor,
            number: number,
            pulse: pulse,
            temperature: temperature,
            activeStep: activeStep,
            specialization: specialization),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConnectivityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.connectivityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportView({
    required String reportUrl,
    required String reportName,
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reportView,
        arguments: ReportViewArguments(
            reportUrl: reportUrl, reportName: reportName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSymptomsView({
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.symptomsView,
        arguments: SymptomsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMedicineView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.medicineView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllReportsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allReportsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDiagnosisView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.diagnosisView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
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

  Future<dynamic> replaceWithAuthView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.authView,
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

  Future<dynamic> replaceWithConsultationView({
    required String? userName,
    required String? age,
    required String? gender,
    required String? phoneNumber,
    required String? id,
    required String? appointId,
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.consultationView,
        arguments: ConsultationViewArguments(
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

  Future<dynamic> replaceWithPrintView({
    _i15.Key? key,
    required String? advice,
    required String? reports,
    required String? age,
    required String? bp,
    required String? complaints,
    required String? diagnosis,
    required String? gender,
    required String? height,
    required List<_i16.MedicineModel> medicine,
    required String? phoneNumber,
    required String? userName,
    required String? weight,
    required String? doctor,
    required String? number,
    required String? pulse,
    required String? temperature,
    required String? activeStep,
    required String? specialization,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.printView,
        arguments: PrintViewArguments(
            key: key,
            advice: advice,
            reports: reports,
            age: age,
            bp: bp,
            complaints: complaints,
            diagnosis: diagnosis,
            gender: gender,
            height: height,
            medicine: medicine,
            phoneNumber: phoneNumber,
            userName: userName,
            weight: weight,
            doctor: doctor,
            number: number,
            pulse: pulse,
            temperature: temperature,
            activeStep: activeStep,
            specialization: specialization),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConnectivityView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.connectivityView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportView({
    required String reportUrl,
    required String reportName,
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reportView,
        arguments: ReportViewArguments(
            reportUrl: reportUrl, reportName: reportName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSymptomsView({
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.symptomsView,
        arguments: SymptomsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMedicineView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.medicineView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllReportsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allReportsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDiagnosisView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.diagnosisView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
