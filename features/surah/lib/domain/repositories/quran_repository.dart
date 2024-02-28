import '../entities/surah_entities.dart';

abstract class QuranRepository {
  Future<List<SurahEntity>> getAllSurah();
}
