import 'package:clean_artitecture/src/domain/responses/breaking_news_response.dart';

import '../../util/resources/data_state.dart';
import '../models/requests/breaking_news_request.dart';

abstract class BreakingNewsRepository {
  Future<DataState<BreakingNewsResponse?>> getBreakingNews(
      {required BreakingNewsRequest? breakingNewsRequest});
}
