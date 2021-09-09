import 'package:auto_route/annotations.dart';

import 'chat.dart';
import 'game.dart';
import 'login.dart';
import 'map.dart';
import 'oauth2.dart';
import 'orders.dart';
import 'start.dart';

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
