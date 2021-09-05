import 'package:auto_route/annotations.dart';

import 'login.dart';
import 'start.dart';
import 'loading.dart';
import 'oauth2.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Loading, initial: true),
    AutoRoute(page: Start),
    AutoRoute(page: Login),
    AutoRoute(page: OAuth2, path: "/OAuth2"),
  ],
)
class $AppRouter {}
