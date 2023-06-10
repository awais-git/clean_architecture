part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState extends Equatable {
  const RemoteArticlesState(
      {this.articles = const [], this.dioError, this.noMoreData = false});

  final List<Articles> articles;
  final DioError? dioError;
  final bool noMoreData;

  @override
  List<Object?> get props => [articles, dioError, noMoreData];
}

class RemoteArticlesLoadingState extends RemoteArticlesState {
  const RemoteArticlesLoadingState();
}

class RemoteArticlesErrorState extends RemoteArticlesState {
  const RemoteArticlesErrorState({super.dioError});
}

class RemoteArticlesSuccessState extends RemoteArticlesState {
  const RemoteArticlesSuccessState({super.articles, super.noMoreData});
}
