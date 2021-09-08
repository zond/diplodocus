// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import 'chat.dart' as _i8;
import 'game.dart' as _i6;
import 'login.dart' as _i4;
import 'map.dart' as _i7;
import 'oauth2.dart' as _i5;
import 'orders.dart' as _i9;
import 'start.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    StartRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.Start();
        }),
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.Login();
        }),
    OAuth2Route.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.OAuth2();
        }),
    GameRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<GameRouteArgs>();
          return _i6.Game(key: args.key, gameID: args.gameID);
        }),
    MapRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MapRouteArgs>();
          return _i7.Map(key: args.key, gameID: args.gameID);
        }),
    ChatRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ChatRouteArgs>();
          return _i8.Chat(key: args.key, gameID: args.gameID);
        }),
    OrdersRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OrdersRouteArgs>();
          return _i9.Orders(key: args.key, gameID: args.gameID);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(StartRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/Login'),
        _i1.RouteConfig(OAuth2Route.name, path: '/OAuth2'),
        _i1.RouteConfig(GameRoute.name, path: '/Game', children: [
          _i1.RouteConfig(MapRoute.name, path: ''),
          _i1.RouteConfig(ChatRoute.name, path: 'Chat'),
          _i1.RouteConfig(OrdersRoute.name, path: 'Orders')
        ])
      ];
}

class StartRoute extends _i1.PageRouteInfo {
  const StartRoute() : super(name, path: '/');

  static const String name = 'StartRoute';
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/Login');

  static const String name = 'LoginRoute';
}

class OAuth2Route extends _i1.PageRouteInfo {
  const OAuth2Route() : super(name, path: '/OAuth2');

  static const String name = 'OAuth2Route';
}

class GameRoute extends _i1.PageRouteInfo<GameRouteArgs> {
  GameRoute(
      {_i2.Key? key, required String gameID, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/Game',
            args: GameRouteArgs(key: key, gameID: gameID),
            initialChildren: children);

  static const String name = 'GameRoute';
}

class GameRouteArgs {
  const GameRouteArgs({this.key, required this.gameID});

  final _i2.Key? key;

  final String gameID;
}

class MapRoute extends _i1.PageRouteInfo<MapRouteArgs> {
  MapRoute({_i2.Key? key, required String gameID})
      : super(name, path: '', args: MapRouteArgs(key: key, gameID: gameID));

  static const String name = 'MapRoute';
}

class MapRouteArgs {
  const MapRouteArgs({this.key, required this.gameID});

  final _i2.Key? key;

  final String gameID;
}

class ChatRoute extends _i1.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i2.Key? key, required String gameID})
      : super(name,
            path: 'Chat', args: ChatRouteArgs(key: key, gameID: gameID));

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.gameID});

  final _i2.Key? key;

  final String gameID;
}

class OrdersRoute extends _i1.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({_i2.Key? key, required String gameID})
      : super(name,
            path: 'Orders', args: OrdersRouteArgs(key: key, gameID: gameID));

  static const String name = 'OrdersRoute';
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key, required this.gameID});

  final _i2.Key? key;

  final String gameID;
}
