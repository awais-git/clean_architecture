import 'package:clean_artitecture/src/config/themes/app_themes.dart';
import 'package:clean_artitecture/src/config/routes/app_router.dart';
import 'package:clean_artitecture/src/domain/repositories/api_repository.dart';
import 'package:clean_artitecture/src/locator.dart';
import 'package:clean_artitecture/src/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDepedencies();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoteArticlesCubit(
            locator<BreakingNewsRepository>(),
          )..getBreakingNewsArticles(),
        )
      ],
      child: MaterialApp.router(
        theme: AppThemes.lightTheme,
        routerConfig: router,
      ),
    );
  }
}
