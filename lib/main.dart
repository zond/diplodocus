import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  AppRouterDelegate _routerDelegate = AppRouterDelegate();
  AppRouteInformationParser _routeInformationParser = AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Diplodocus',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class AppRouteInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) async {
    return Uri.parse(routeInformation.location.toString());
  }

  @override
  RouteInformation restoreRouteInformation(Uri uri) {
    return RouteInformation(location: uri.toString());
  }
}

class AppRouterDelegate extends RouterDelegate<Uri> with ChangeNotifier, PopNavigatorRouterDelegateMixin<Uri> {
  final GlobalKey<NavigatorState> navigatorKey;
  Uri uri = Uri.parse("/");

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  Uri get currentConfiguration {
    return uri;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('Login'),
          child: Login(),
        ),
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Uri uri) async {
    this.uri = uri;
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diplodocus"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ElevatedButton.icon(
                  icon: SvgPicture.asset(
                    "images/google_icon.svg",
                    semanticsLabel: "Google logo",
                  ),
                  onPressed: () { debugPrint("hehu"); },
                  label: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
