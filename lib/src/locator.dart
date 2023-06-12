import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/api_respository_impl.dart';
import 'domain/repositories/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDepedencies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton<RestClient>(
    RestClient(locator<Dio>()),
  );

  locator.registerSingleton<BreakingNewsRepository>(
    ApiRepositoryImpl(locator<RestClient>()),
  );

  // locator.registerSingleton<BlocProviders>(BlocProviders());
}
