import 'package:go_router/go_router.dart';

import '../../presentation/views/breaking_news_view.dart';


final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BreakingNewsView(),
    ),
  ],
);
