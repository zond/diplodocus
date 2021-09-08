import 'package:auto_route/annotations.dart';

import 'login.dart';
import 'start.dart';
import 'oauth2.dart';
import 'game.dart';
import 'map.dart';
import 'chat.dart';
import 'orders.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Start, initial: true),
    AutoRoute(page: Login),
    AutoRoute(page: OAuth2, path: "/OAuth2"),
    AutoRoute(
      page: Game,
      path: "/Game/:gameID",
      children: [
        AutoRoute(page: Map, path: ''),
        AutoRoute(page: Chat, path: 'Chat'),
        AutoRoute(page: Orders, path: 'Orders'),
      ],
    )
  ],
)
class $AppRouter {}
