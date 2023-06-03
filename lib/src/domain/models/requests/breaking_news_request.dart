import 'package:clean_artitecture/src/util/constants/strings.dart';

class BreakingNewsRequest {
  final String apiKey;
  final String country;
  final String category;
  final int page;
  final int pageSize;

  BreakingNewsRequest(
      {this.apiKey = breakingNewsApiKey,
      this.country = "us",
      this.category = "general",
      this.page = 1,
      this.pageSize = 20});
}
