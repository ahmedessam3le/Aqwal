import 'package:aqwal/core/api/api_consumer.dart';
import 'package:aqwal/core/api/app_interceptors.dart';
import 'package:aqwal/core/api/dio_consumer.dart';
import 'package:aqwal/core/network/network_info.dart';
import 'package:aqwal/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:aqwal/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:aqwal/features/random_quote/data/repositories/quote_repository.dart';
import 'package:aqwal/features/random_quote/domain/repositories/quote_repository_contract.dart';
import 'package:aqwal/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:aqwal/features/random_quote/presentation/cubits/random_quote_cubit.dart';
import 'package:aqwal/features/splash/data/data_sources/language_locale_data_source.dart';
import 'package:aqwal/features/splash/data/repositories/language_repository.dart';
import 'package:aqwal/features/splash/domain/repositories/language_repository_contract.dart';
import 'package:aqwal/features/splash/domain/use_cases/change_language_use_case.dart';
import 'package:aqwal/features/splash/domain/use_cases/get_saved_language_use_case.dart';
import 'package:aqwal/features/splash/presentation/cubits/locale_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // 1 - Features
  // a) Blocs
  serviceLocator.registerFactory<RandomQuoteCubit>(
    () => RandomQuoteCubit(
      getRandomQuoteUseCase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<LocaleCubit>(
    () => LocaleCubit(
      getSavedLanguageUseCase: serviceLocator(),
      changeLanguageUseCase: serviceLocator(),
    ),
  );

  // b) Use Cases
  serviceLocator.registerLazySingleton<GetRandomQuote>(
    () => GetRandomQuote(
      quoteRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<GetSavedLanguageUseCase>(
    () => GetSavedLanguageUseCase(
      languageRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ChangeLanguageUseCase>(
    () => ChangeLanguageUseCase(
      languageRepository: serviceLocator(),
    ),
  );

  // c) Repositories
  serviceLocator.registerLazySingleton<QuoteRepositoryContract>(
    () => QuoteRepository(
      randomQuoteRemoteDataSource: serviceLocator(),
      randomQuoteLocalDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<LanguageRepositoryContract>(
    () => LanguageRepository(
      languageLocaleDataSourceContract: serviceLocator(),
    ),
  );

  // d) Data Sources
  serviceLocator.registerLazySingleton<RandomQuoteRemoteDataSourceContract>(
    () => RandomQuoteRemoteDataSource(
      apiConsumer: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<RandomQuoteLocalDataSourceContract>(
    () => RandomQuoteLocalDataSource(
      sharedPreferences: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<LanguageLocaleDataSourceContract>(
    () => LanguageLocaleDataSource(
      sharedPreferences: serviceLocator(),
    ),
  );

  // 2 - Core

  serviceLocator.registerLazySingleton<NetworkInfoContract>(
    () => NetworkInfo(
      connectionChecker: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: serviceLocator()));

  // 3 - External

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
  serviceLocator.registerLazySingleton(() => AppInterceptors());
  serviceLocator.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
}
