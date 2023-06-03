import 'package:clean_artitecture/src/domain/models/requests/breaking_news_request.dart';
import 'package:clean_artitecture/src/domain/repositories/api_repository.dart';
import 'package:clean_artitecture/src/util/resources/data_state.dart';
import 'package:clean_artitecture/src/domain/responses/breaking_news_response.dart';

import '../datasources/remote/news_api_service.dart';
import 'base/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRespository {
  final RestClient _newsApiService;

  ApiRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<BreakingNewsResponse?>> getBreakingNews(
      {required BreakingNewsRequest? breakingNewsRequest}) {
    return getStateOf<BreakingNewsResponse>(
      request: () => _newsApiService.getBreakingNewsArticles(
        apiKey: breakingNewsRequest?.apiKey,
        category: breakingNewsRequest?.category,
        country: breakingNewsRequest?.country,
        page: breakingNewsRequest?.page,
        pageSize: breakingNewsRequest?.pageSize,
      ),
    );
  }
}
