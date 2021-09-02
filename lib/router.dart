import 'package:diplodocus/start.dart';
import 'package:diplodocus/login.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Start, initial: true),
    AutoRoute(page: Login),
  ],
)
class $AppRouter {}
