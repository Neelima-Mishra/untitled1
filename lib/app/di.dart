import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/bloc/splash/splash_bloc.dart';

import '../bloc/list/list_bloc.dart';
import '../bloc/navigation/navigation_bloc.dart';
import '../data/data_source/local_data_source.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/network/http_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/models/user_login_model.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/list_usecase.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance.registerLazySingleton<AppPrefs>(() => AppPrefs(instance()));

  // http factory
  instance.registerLazySingleton<HTTPFactory>(() => HTTPFactory());

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(httpFactory: instance()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementer(appPrefs: instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
      remoteDataSource: instance(),
      localDataSource: instance(),
      networkInfo: instance()));

  // network info
  instance.registerLazySingleton<UserData>(() => UserData(
      accessToken:
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmQ1M2VhYjJlZDcwMTY0ODk0Mzk3YzRkMTYyYmY4YTg0MDcyYjYzNzk0YWFkZjU4MjBhZjcwYTI4N2EwODIyNTViZjRlMzk5NTdkN2ZjOGEiLCJpYXQiOjE2Nzc0Nzk2NDEuMDY0MDk5LCJuYmYiOjE2Nzc0Nzk2NDEuMDY0MTAzLCJleHAiOjE3MDkwMTU2NDEuMDAzNzUzLCJzdWIiOiI0MCIsInNjb3BlcyI6W119.eaZEVADU4R7JT7fhFxUAzptnkJmAX-eBjSW7apseEExsJmNlFTCTNh-fR3Tkik76em_Qd1etpAA-v8ondK6MVM7nQI8khblyEKHbsY2m0E6MXcSMpIB-JZPRn6bapKug_Uzqhl9YVhbhdg8N9zIgSZ2DxfnPzi_ISKPCQwHbRF_pdyxgIyKCPmUKrsYVaPBL6gFkHXJFACqa8yXw3TbxfjMyjGvMzQ-w7TKuYmszZYtIUuU5rnH4YtpfxJs-N4blHJAugNZb3BP-V1euymzhrvRC1tLmgJw639FKD0yspiEBpHyp14V2gXaHBByCIv-c5BWzzCuAZ5FsXurSYU53q4ZDsHpZoPimCZH-yyIRaBQ7L-HootkcIwcGpdhbv6EFzU5Xpi4BPQBJ6UBhfjAzH_-YDQC4GL8bv3gM9MBTc4oMuMcOdGy5ZDSNiNBiYYT7ph-BAUgYdfvla4ubUh4yJGeakuWXexeKE4yl9phtafrF98REHJREJWtweVz5srNhnmulfIEAXv9gGegdfMp0kRjPx1-MdLjfKzOSlGtqL5rRZgboAJh3GgsRb19CSk6LQ25D7OW0vjW4FxiqxrcEcjwnbJY3U9eqDUCgIsV4FiO8EWGafaGmjfpJDBeyJjUAeBwUWzyGnVDMRSvqim9KN5wgx0MUeP_Hu00K2hqvZRA"));
}

initHomeModule() {
  if (!GetIt.I.isRegistered<ListUseCase>()) {
    instance.registerFactory<ListUseCase>(
        () => ListUseCase(repository: instance()));
    instance.registerFactory<ListBloc>(() => ListBloc(listUseCase: instance()));
  }
}

initSplashModule() {
  if (!GetIt.I.isRegistered<SplashBloc>()) {
    instance.registerFactory<SplashBloc>(() => SplashBloc());
  }
}

initNavigationModule() {
  if (!GetIt.I.isRegistered<NavigationBloc>()) {
    instance.registerFactory<NavigationBloc>(() => NavigationBloc());
  }
}