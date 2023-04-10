import 'package:auto_route/auto_route.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/notes_overview_page.dart';
import 'package:notes_firebase_ddd_course/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase_ddd_course/presentation/splash/splash_page.dart';

import 'router.gr.dart';

// @MaterialAutoRouter(
// routes: [
//   AutoRoute(
//     page: SplashPage,
//     initial: true,
//   ),
//   AutoRoute(
//     page: SignInPage,
//   ),
//   AutoRoute(
//     page: NotesOverviewPage,
//   ),
// ],
// )
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/',
        ),
        AutoRoute(page: SignInRoute.page, path: '/sign-in'),
        AutoRoute(page: NotesOverviewRoute.page, path: '/notes-overview'),
      ];
}
