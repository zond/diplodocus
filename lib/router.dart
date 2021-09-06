import 'package:auto_route/annotations.dart';

import 'login.dart';
import 'start.dart';
import 'oauth2.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Start, initial: true),
    AutoRoute(page: Login),
    AutoRoute(page: OAuth2, path: "/OAuth2"),
  ],
)
class $AppRouter {}
