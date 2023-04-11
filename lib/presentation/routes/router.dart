import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(page: SignInRoute.page, path: '/sign-in'),
        AutoRoute(page: NotesOverviewRoute.page, path: '/notes-overview'),
        AutoRoute(
          page: NoteFormRoute.page,
          path: '/note-form',
          fullscreenDialog: true,
        )
      ];
}
