import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/common/utils/named_routes.dart';
import 'package:shared/shared.dart';
import 'package:surah/data/remote/remote_quran.dart';
import 'package:surah/data/repositories/quran_repository_impl.dart';
import 'package:surah/domain/repositories/quran_repository.dart';
import 'package:surah/domain/usecase/quran_usecase.dart';
import 'package:surah/surah.dart';
import 'package:dio/dio.dart';
class AppModule extends Module {
  @override
  List<Module> get imports => [
        SharedModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind((_) => NamedRoutes(), export: true),
        // Bind((_) => RemoteQuranDataSourceImpl(
        //   // dio: Modular.get<Dio>()
        //   ),
        // ),
        // Bind(
        //       (_) => QuranRepositoryImpl(
        //     remoteQuranDataSource: Modular.get<RemoteQuranDataSource>(),
        //   ),
        // ),
        // Bind((_) => QuranUseCaseImpl(
        //     quranRepository: Modular.get<QuranRepository>()),
        // ),

      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: FeatureSurahModule(),
        ),
        ModuleRoute(
          Modular.get<NamedRoutes>().home,
          module: FeatureSurahModule(),
        ),
      ];
}

class QuranApp extends StatefulWidget {
  const QuranApp({super.key});

  @override
  State<QuranApp> createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,

    );
  }
}
