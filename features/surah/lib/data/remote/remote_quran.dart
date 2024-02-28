import '../models/surah_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteQuranDataSource {
  Future<SurahModel> getAllSurah();
}

class RemoteQuranDataSourceImpl extends RemoteQuranDataSource {
  // final Dio dio;

  RemoteQuranDataSourceImpl();

  @override
  Future<SurahModel> getAllSurah() async {
    final Dio dio = Dio();
    final response = await dio.get('http://api.alquran.cloud/v1/surah');
    return SurahModel.fromJson(response.data);
  }
}
