// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i17;
import 'package:flutter/material.dart';
import 'package:opdsolutionui/ui/views/auth/auth_view.dart' as _i4;
import 'package:opdsolutionui/ui/views/auth/otp/otp_view.dart' as _i5;
import 'package:opdsolutionui/ui/views/auth/sign_up/sign_up_view.dart' as _i12;
import 'package:opdsolutionui/ui/views/connectivity/connectivity_view.dart'
    as _i11;
import 'package:opdsolutionui/ui/views/doctor/doctor_view.dart' as _i6;
import 'package:opdsolutionui/ui/views/edit_profile/edit_profile_view.dart'
    as _i8;
import 'package:opdsolutionui/ui/views/history/history_view.dart' as _i14;
import 'package:opdsolutionui/ui/views/history_upload/history_upload_view.dart'
    as _i15;
import 'package:opdsolutionui/ui/views/home/home_view.dart' as _i2;
import 'package:opdsolutionui/ui/views/medicines/medicines_view.dart' as _i13;
import 'package:opdsolutionui/ui/views/preview/preview_view.dart' as _i16;
import 'package:opdsolutionui/ui/views/profile/profile_view.dart' as _i7;
import 'package:opdsolutionui/ui/views/report/report_view.dart' as _i9;
import 'package:opdsolutionui/ui/views/report_preview/report_preview_view.dart'
    as _i10;
import 'package:opdsolutionui/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const authView = '/auth-view';

  static const otpView = '/otp-view';

  static const doctorView = '/doctor-view';

  static const profileView = '/profile-view';

  static const editProfileView = '/edit-profile-view';

  static const reportView = '/report-view';

  static const reportPreviewView = '/report-preview-view';

  static const connectivityView = '/connectivity-view';

  static const signUpView = '/sign-up-view';

  static const medicinesView = '/medicines-view';

  static const historyView = '/history-view';

  static const historyUploadView = '/history-upload-view';

  static const previewView = '/preview-view';

  static const all = <String>{
    homeView,
    startupView,
    authView,
    otpView,
    doctorView,
    profileView,
    editProfileView,
    reportView,
    reportPreviewView,
    connectivityView,
    signUpView,
    medicinesView,
    historyView,
    historyUploadView,
    previewView,
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
      Routes.doctorView,
      page: _i6.DoctorView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i7.ProfileView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i8.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.reportView,
      page: _i9.ReportView,
    ),
    _i1.RouteDef(
      Routes.reportPreviewView,
      page: _i10.ReportPreviewView,
    ),
    _i1.RouteDef(
      Routes.connectivityView,
      page: _i11.ConnectivityView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i12.SignUpView,
    ),
    _i1.RouteDef(
      Routes.medicinesView,
      page: _i13.MedicinesView,
    ),
    _i1.RouteDef(
      Routes.historyView,
      page: _i14.HistoryView,
    ),
    _i1.RouteDef(
      Routes.historyUploadView,
      page: _i15.HistoryUploadView,
    ),
    _i1.RouteDef(
      Routes.previewView,
      page: _i16.PreviewView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.AuthView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AuthView(),
        settings: data,
      );
    },
    _i5.OtpView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OtpView(),
        settings: data,
      );
    },
    _i6.DoctorView: (data) {
      final args = data.getArgs<DoctorViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.DoctorView(args.name, args.id, key: args.key),
        settings: data,
      );
    },
    _i7.ProfileView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfileView(),
        settings: data,
      );
    },
    _i8.EditProfileView: (data) {
      final args = data.getArgs<EditProfileViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.EditProfileView(args.id, args.patientName,
            args.phoneNumber, args.age, args.gender, args.base64Image,
            key: args.key),
        settings: data,
      );
    },
    _i9.ReportView: (data) {
      final args = data.getArgs<ReportViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.ReportView(id: args.id, key: args.key),
        settings: data,
      );
    },
    _i10.ReportPreviewView: (data) {
      final args = data.getArgs<ReportPreviewViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ReportPreviewView(
            base64Data: args.base64Data,
            indexName: args.indexName,
            key: args.key),
        settings: data,
      );
    },
    _i11.ConnectivityView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ConnectivityView(),
        settings: data,
      );
    },
    _i12.SignUpView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SignUpView(),
        settings: data,
      );
    },
    _i13.MedicinesView: (data) {
      final args = data.getArgs<MedicinesViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.MedicinesView(args.mdedicinesDetails, key: args.key),
        settings: data,
      );
    },
    _i14.HistoryView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.HistoryView(),
        settings: data,
      );
    },
    _i15.HistoryUploadView: (data) {
      final args = data.getArgs<HistoryUploadViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.HistoryUploadView(
            sheetName: args.sheetName, id: args.id, key: args.key),
        settings: data,
      );
    },
    _i16.PreviewView: (data) {
      final args = data.getArgs<PreviewViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.PreviewView(
            id: args.id,
            result: args.result,
            isreport: args.isreport,
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

class DoctorViewArguments {
  const DoctorViewArguments({
    required this.name,
    required this.id,
    this.key,
  });

  final String name;

  final String id;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"name": "$name", "id": "$id", "key": "$key"}';
  }

  @override
  bool operator ==(covariant DoctorViewArguments other) {
    if (identical(this, other)) return true;
    return other.name == name && other.id == id && other.key == key;
  }

  @override
  int get hashCode {
    return name.hashCode ^ id.hashCode ^ key.hashCode;
  }
}

class EditProfileViewArguments {
  const EditProfileViewArguments({
    required this.id,
    required this.patientName,
    required this.phoneNumber,
    required this.age,
    required this.gender,
    required this.base64Image,
    this.key,
  });

  final String? id;

  final String? patientName;

  final String? phoneNumber;

  final String? age;

  final String? gender;

  final String? base64Image;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"id": "$id", "patientName": "$patientName", "phoneNumber": "$phoneNumber", "age": "$age", "gender": "$gender", "base64Image": "$base64Image", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.id == id &&
        other.patientName == patientName &&
        other.phoneNumber == phoneNumber &&
        other.age == age &&
        other.gender == gender &&
        other.base64Image == base64Image &&
        other.key == key;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        patientName.hashCode ^
        phoneNumber.hashCode ^
        age.hashCode ^
        gender.hashCode ^
        base64Image.hashCode ^
        key.hashCode;
  }
}

class ReportViewArguments {
  const ReportViewArguments({
    required this.id,
    this.key,
  });

  final String id;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"id": "$id", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ReportViewArguments other) {
    if (identical(this, other)) return true;
    return other.id == id && other.key == key;
  }

  @override
  int get hashCode {
    return id.hashCode ^ key.hashCode;
  }
}

class ReportPreviewViewArguments {
  const ReportPreviewViewArguments({
    required this.base64Data,
    required this.indexName,
    this.key,
  });

  final String base64Data;

  final String indexName;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"base64Data": "$base64Data", "indexName": "$indexName", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ReportPreviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.base64Data == base64Data &&
        other.indexName == indexName &&
        other.key == key;
  }

  @override
  int get hashCode {
    return base64Data.hashCode ^ indexName.hashCode ^ key.hashCode;
  }
}

class MedicinesViewArguments {
  const MedicinesViewArguments({
    required this.mdedicinesDetails,
    this.key,
  });

  final List<dynamic>? mdedicinesDetails;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"mdedicinesDetails": "$mdedicinesDetails", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MedicinesViewArguments other) {
    if (identical(this, other)) return true;
    return other.mdedicinesDetails == mdedicinesDetails && other.key == key;
  }

  @override
  int get hashCode {
    return mdedicinesDetails.hashCode ^ key.hashCode;
  }
}

class HistoryUploadViewArguments {
  const HistoryUploadViewArguments({
    required this.sheetName,
    required this.id,
    this.key,
  });

  final String sheetName;

  final String id;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"sheetName": "$sheetName", "id": "$id", "key": "$key"}';
  }

  @override
  bool operator ==(covariant HistoryUploadViewArguments other) {
    if (identical(this, other)) return true;
    return other.sheetName == sheetName && other.id == id && other.key == key;
  }

  @override
  int get hashCode {
    return sheetName.hashCode ^ id.hashCode ^ key.hashCode;
  }
}

class PreviewViewArguments {
  const PreviewViewArguments({
    required this.id,
    required this.result,
    required this.isreport,
    this.key,
  });

  final String id;

  final dynamic result;

  final bool isreport;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"id": "$id", "result": "$result", "isreport": "$isreport", "key": "$key"}';
  }

  @override
  bool operator ==(covariant PreviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.id == id &&
        other.result == result &&
        other.isreport == isreport &&
        other.key == key;
  }

  @override
  int get hashCode {
    return id.hashCode ^ result.hashCode ^ isreport.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i18.NavigationService {
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

  Future<dynamic> navigateToDoctorView({
    required String name,
    required String id,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.doctorView,
        arguments: DoctorViewArguments(name: name, id: id, key: key),
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

  Future<dynamic> navigateToEditProfileView({
    required String? id,
    required String? patientName,
    required String? phoneNumber,
    required String? age,
    required String? gender,
    required String? base64Image,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        arguments: EditProfileViewArguments(
            id: id,
            patientName: patientName,
            phoneNumber: phoneNumber,
            age: age,
            gender: gender,
            base64Image: base64Image,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportView({
    required String id,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reportView,
        arguments: ReportViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportPreviewView({
    required String base64Data,
    required String indexName,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reportPreviewView,
        arguments: ReportPreviewViewArguments(
            base64Data: base64Data, indexName: indexName, key: key),
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

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMedicinesView({
    required List<dynamic>? mdedicinesDetails,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.medicinesView,
        arguments: MedicinesViewArguments(
            mdedicinesDetails: mdedicinesDetails, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistoryUploadView({
    required String sheetName,
    required String id,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.historyUploadView,
        arguments:
            HistoryUploadViewArguments(sheetName: sheetName, id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPreviewView({
    required String id,
    required dynamic result,
    required bool isreport,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.previewView,
        arguments: PreviewViewArguments(
            id: id, result: result, isreport: isreport, key: key),
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

  Future<dynamic> replaceWithDoctorView({
    required String name,
    required String id,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.doctorView,
        arguments: DoctorViewArguments(name: name, id: id, key: key),
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

  Future<dynamic> replaceWithEditProfileView({
    required String? id,
    required String? patientName,
    required String? phoneNumber,
    required String? age,
    required String? gender,
    required String? base64Image,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        arguments: EditProfileViewArguments(
            id: id,
            patientName: patientName,
            phoneNumber: phoneNumber,
            age: age,
            gender: gender,
            base64Image: base64Image,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportView({
    required String id,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reportView,
        arguments: ReportViewArguments(id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportPreviewView({
    required String base64Data,
    required String indexName,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reportPreviewView,
        arguments: ReportPreviewViewArguments(
            base64Data: base64Data, indexName: indexName, key: key),
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

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMedicinesView({
    required List<dynamic>? mdedicinesDetails,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.medicinesView,
        arguments: MedicinesViewArguments(
            mdedicinesDetails: mdedicinesDetails, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistoryUploadView({
    required String sheetName,
    required String id,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.historyUploadView,
        arguments:
            HistoryUploadViewArguments(sheetName: sheetName, id: id, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPreviewView({
    required String id,
    required dynamic result,
    required bool isreport,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.previewView,
        arguments: PreviewViewArguments(
            id: id, result: result, isreport: isreport, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
