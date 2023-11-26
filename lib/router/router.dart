import 'package:auto_route/auto_route.dart';
import 'package:example/features/favorites/favorites.dart';
import 'package:example/features/history/history.dart';
import 'package:example/features/home/home.dart';
import 'package:example/features/search/search.dart';
import 'package:example/features/settings/settings.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: SearchRoute.page,
              path: 'search',
            ),
            AutoRoute(
              page: FavoritesRoute.page,
              path: 'favorites',
            ),
            AutoRoute(
              page: HistoryRoute.page,
              path: 'history',
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
            ),
          ],
        ),
      ];
}
