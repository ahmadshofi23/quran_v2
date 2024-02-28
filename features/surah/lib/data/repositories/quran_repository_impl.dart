import 'package:surah/domain/entities/surah_entities.dart';
import 'package:surah/domain/repositories/quran_repository.dart';
import '../remote/remote_quran.dart';

class QuranRepositoryImpl extends QuranRepository {
  final RemoteQuranDataSource remoteQuranDataSource;

  QuranRepositoryImpl({
    required this.remoteQuranDataSource,
  });

  @override
  Future<List<SurahEntity>> getAllSurah() async {
    List<SurahEntity> dataSurah = [];
    final response = await remoteQuranDataSource.getAllSurah();
    if (response.data != null) {
      for (var i in response.data!) {
        dataSurah.add(SurahEntity(
          relevationType: i.revelationType,
          numberOfAyat: i.numberOfAyahs,
          englishName: i.englishName,
          name: i.name,
          number: i.number,
        ));
        print('ini data nomor surah ${i.number} ');
      }
    }

    return dataSurah;
  }
}
