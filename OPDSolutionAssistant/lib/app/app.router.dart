// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:doc_ease/ui/views/appointment_details/appointment_details_view.dart'
    as _i6;
import 'package:doc_ease/ui/views/connectivity/connectivity_view.dart' as _i9;
import 'package:doc_ease/ui/views/home/home_view.dart' as _i2;
import 'package:doc_ease/ui/views/login/login_view.dart' as _i4;
import 'package:doc_ease/ui/views/otp/otp_view.dart' as _i5;
import 'package:doc_ease/ui/views/search_user/search_user_view.dart' as _i7;
import 'package:doc_ease/ui/views/startup/startup_view.dart' as _i3;
import 'package:doc_ease/ui/views/user_detail/user_detail_view.dart' as _i8;
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const otpView = '/otp-view';

  static const appointmentDetailsView = '/appointment-details-view';

  static const searchUserView = '/search-user-view';

  static const userDetailView = '/user-detail-view';

  static const connectivityView = '/connectivity-view';

  static const all = <String>{
    homeView,
    startupView,
    loginView,
    otpView,
    appointmentDetailsView,
    searchUserView,
    userDetailView,
    connectivityView,
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
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i5.OtpView,
    ),
    _i1.RouteDef(
      Routes.appointmentDetailsView,
      page: _i6.AppointmentDetailsView,
    ),
    _i1.RouteDef(
      Routes.searchUserView,
      page: _i7.SearchUserView,
    ),
    _i1.RouteDef(
      Routes.userDetailView,
      page: _i8.UserDetailView,
    ),
    _i1.RouteDef(
      Routes.connectivityView,
      page: _i9.ConnectivityView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.OtpView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OtpView(),
        settings: data,
      );
    },
    _i6.AppointmentDetailsView: (data) {
      final args = data.getArgs<AppointmentDetailsViewArguments>(
        orElse: () => const AppointmentDetailsViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.AppointmentDetailsView(
            id: args.id,
            screenType: args.screenType,
            appointmentDate: args.appointmentDate,
            appointmentId: args.appointmentId,
            key: args.key),
        settings: data,
      );
    },
    _i7.SearchUserView: (data) {
      final args = data.getArgs<SearchUserViewArguments>(
        orElse: () => const SearchUserViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.SearchUserView(key: args.key),
        settings: data,
      );
    },
    _i8.UserDetailView: (data) {
      final args = data.getArgs<UserDetailViewArguments>(
        orElse: () => const UserDetailViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.UserDetailView(
            allUsersList: args.allUsersList, index: args.index, key: args.key),
        settings: data,
      );
    },
    _i9.ConnectivityView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ConnectivityView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AppointmentDetailsViewArguments {
  const AppointmentDetailsViewArguments({
    this.id,
    this.screenType,
    this.appointmentDate,
    this.appointmentId,
    this.key,
  });

  final String? id;

  final String? screenType;

  final String? appointmentDate;

  final String? appointmentId;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"id": "$id", "screenType": "$screenType", "appointmentDate": "$appointmentDate", "appointmentId": "$appointmentId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant AppointmentDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.id == id &&
        other.screenType == screenType &&
        other.appointmentDate == appointmentDate &&
        other.appointmentId == appointmentId &&
        other.key == key;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        screenType.hashCode ^
        appointmentDate.hashCode ^
        appointmentId.hashCode ^
        key.hashCode;
  }
}

class SearchUserViewArguments {
  const SearchUserViewArguments({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SearchUserViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class UserDetailViewArguments {
  const UserDetailViewArguments({
    this.allUsersList,
    this.index,
    this.key,
  });

  final List<dynamic>? allUsersList;

  final int? index;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"allUsersList": "$allUsersList", "index": "$index", "key": "$key"}';
  }

  @override
  bool operator ==(covariant UserDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.allUsersList == allUsersList &&
        other.index == index &&
        other.key == key;
  }

  @override
  int get hashCode {
    return allUsersList.hashCode ^ index.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
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

  Future<dynamic> navigateToAppointmentDetailsView({
    String? id,
    String? screenType,
    String? appointmentDate,
    String? appointmentId,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.appointmentDetailsView,
        arguments: AppointmentDetailsViewArguments(
            id: id,
            screenType: screenType,
            appointmentDate: appointmentDate,
            appointmentId: appointmentId,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchUserView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.searchUserView,
        arguments: SearchUserViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserDetailView({
    List<dynamic>? allUsersList,
    int? index,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userDetailView,
        arguments: UserDetailViewArguments(
            allUsersList: allUsersList, index: index, key: key),
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

  Future<dynamic> replaceWithAppointmentDetailsView({
    String? id,
    String? screenType,
    String? appointmentDate,
    String? appointmentId,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.appointmentDetailsView,
        arguments: AppointmentDetailsViewArguments(
            id: id,
            screenType: screenType,
            appointmentDate: appointmentDate,
            appointmentId: appointmentId,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchUserView({
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.searchUserView,
        arguments: SearchUserViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserDetailView({
    List<dynamic>? allUsersList,
    int? index,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userDetailView,
        arguments: UserDetailViewArguments(
            allUsersList: allUsersList, index: index, key: key),
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
}
