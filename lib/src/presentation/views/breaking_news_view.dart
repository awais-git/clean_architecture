import 'package:clean_artitecture/src/presentation/cubits/remote_articles/remote_articles_cubit.dart';
import 'package:clean_artitecture/src/util/extensions/scroll_controller_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../domain/models/articles_model.dart';
import '../widgets/articles_widget.dart';

class BreakingNewsView extends HookWidget {
  const BreakingNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteArticlesCubitBloc =
        BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.onScrollEndsListener(() {
        remoteArticlesCubitBloc.getBreakingNewsArticles();
      });
      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News"),
      ),
      body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case RemoteArticlesErrorState:
              return const Center(child: Icon(Ionicons.refresh));

            case RemoteArticlesLoadingState:
              return const CircularProgressIndicator();

            case RemoteArticlesSuccessState:
              return _buildNews(
                scrollController,
                state.noMoreData,
                state.articles,
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildNews(ScrollController scrollController, bool noMoreData,
      List<Articles> articles) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => ArticleWidget(
                    article: articles[index],
                  ),
              childCount: articles.length),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }
}
