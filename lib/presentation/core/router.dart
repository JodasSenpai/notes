import 'package:auto_route/auto_route.dart';
import 'package:notes/presentation/core/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page,Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: "/home", page: MainRouter.page, children: [
      AutoRoute(
        path: "",
        page: HomeRoute.page,
      ),

    ]),
    AutoRoute(
      path: "/auth",
      page: AuthRouter.page,
      children: [
        AutoRoute(path: "", page: AuthRoute.page),

      ],
    ),
  ];
}

@RoutePage(name: 'MainRouter')
class MainRouterPage extends AutoRouter {
  const MainRouterPage({super.key});
}

@RoutePage(name: 'AuthRouter')
class AuthRouterPage extends AutoRouter {
  const AuthRouterPage({super.key});
}