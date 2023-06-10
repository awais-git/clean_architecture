import 'package:clean_artitecture/src/domain/models/articles_model.dart';
import 'package:clean_artitecture/src/domain/models/requests/breaking_news_request.dart';
import 'package:clean_artitecture/src/domain/repositories/api_repository.dart';
import 'package:clean_artitecture/src/presentation/cubits/base/base_cubit.dart';
import 'package:clean_artitecture/src/util/constants/num.dart';
import 'package:clean_artitecture/src/util/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit
    extends BaseCubit<RemoteArticlesState, List<Articles>> {
  RemoteArticlesCubit(this._apiRespository)
      : super(const RemoteArticlesLoadingState(), []);

  final ApiRespository _apiRespository;

  int _page = 1;

  Future<void> getBreakingNewsArtcles() async {
    if (isBusy) return;
    await run(() async {
      final response = await _apiRespository.getBreakingNews(
          breakingNewsRequest: BreakingNewsRequest(page: _page));

      if (response is DataSuccess) {
        final articles = response.data!.articles;
        final noMoreData = articles.length < defaultPageSize;

        data.addAll(articles);

        _page++;

        emit(
          RemoteArticlesSuccessState(articles: data, noMoreData: noMoreData),
        );
      } else if (data is DataFailed) {
        RemoteArticlesErrorState(dioError: response.error);
      }
    });
  }
}
