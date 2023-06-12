import 'package:clean_artitecture/src/locator.dart';
import 'package:clean_artitecture/src/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/repositories/api_repository.dart';

class BlocProviders {
  List<BlocProvider> blocProviders = [
    BlocProvider(
      create: (context) => RemoteArticlesCubit(
        locator<BreakingNewsRepository>(),
      )..getBreakingNewsArticles(),
    )
  ];
}
