import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/utils/named_routes.dart';
import 'package:surah/data/remote/remote_quran.dart';
import 'package:surah/data/repositories/quran_repository_impl.dart';
import 'package:surah/domain/repositories/quran_repository.dart';
import 'package:surah/domain/usecase/quran_usecase.dart';
import 'package:surah/presentation/bloc/bloc/quran_bloc.dart';
import 'package:surah/presentation/ui/home_pages.dart';
import 'package:surah/presentation/ui/splash_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class FeatureSurahModule extends Module {
  FeatureSurahModule();

  final _namedRoutes = Modular.get<NamedRoutes>();

  @override
  List<Bind> get binds => [
        Bind(
          (_) => RemoteQuranDataSourceImpl(
            // dio: Modular.get<Dio>(),
          ),
        ),
        Bind(
          (_) => QuranRepositoryImpl(
            remoteQuranDataSource: Modular.get<RemoteQuranDataSource>(),
          ),
        ),
        Bind((_) => QuranUseCaseImpl(
            quranRepository: Modular.get<QuranRepository>()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) =>  SplashPages(),
        ),
        ChildRoute(_namedRoutes.home,
            child: (context, args) => BlocProvider(
                  create: (context) => QuranBloc(
                      useCase: Modular.get<QuranUseCase>()),
                  child: HomePages(),
                ))
      ];
}
