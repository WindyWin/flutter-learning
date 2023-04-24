import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/presentation/Home/HomeView.dart';
import 'package:mvvm/presentation/LearnFlutter/learn_flutter_view.dart';
import 'package:mvvm/presentation/Login/login_view.dart';
import 'package:mvvm/presentation/Table/components/table_basic_example.dart';
import 'package:mvvm/router/ProtectedRouter.dart';

import '../presentation/Course/course_view.dart';
import '../presentation/Table/table_view.dart';

enum Pages { login, home, table, learnFlutter, course }

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/login",
  // navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Container();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginView();
          },
        ),
        ShellRoute(
            navigatorKey: _rootNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: 'home',
                builder: (BuildContext context, GoRouterState state) {
                  return const HomeView();
                },
              ),
              GoRoute(
                path: 'table',
                builder: (BuildContext context, GoRouterState state) {
                  return TableBasicsExample();
                },
              ),
              GoRoute(
                path: 'learn-flutter',
                builder: (BuildContext context, GoRouterState state) {
                  return const LearnFlutterView();
                },
              ),
              GoRoute(
                path: 'course',
                builder: (BuildContext context, GoRouterState state) {
                  return const CourseView();
                },
              )
            ],
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return ClientPage(child: child);
            }),
      ],
    ),
  ],
);
