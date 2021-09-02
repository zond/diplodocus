import 'package:diplodocus/start.dart';
import 'package:diplodocus/login.dart';
import 'package:diplodocus/loading.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Loading, initial: true),
    AutoRoute(page: Start),
    AutoRoute(page: Login),
  ],
)
class $AppRouter {}
