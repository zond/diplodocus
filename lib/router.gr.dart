// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'loading.dart' as _i3;
import 'login.dart' as _i5;
import 'start.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.Loading();
        }),
    StartRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.Start();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.Login();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoadingRoute.name, path: '/'),
        _i1.RouteConfig(StartRoute.name, path: '/Start'),
        _i1.RouteConfig(LoginRoute.name, path: '/Login')
      ];
}

class LoadingRoute extends _i1.PageRouteInfo {
  const LoadingRoute() : super(name, path: '/');

  static const String name = 'LoadingRoute';
}

class StartRoute extends _i1.PageRouteInfo {
  const StartRoute() : super(name, path: '/Start');

  static const String name = 'StartRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/Login');

  static const String name = 'LoginRoute';
}
