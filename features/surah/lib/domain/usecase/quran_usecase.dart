import 'package:surah/domain/entities/surah_entities.dart';
import 'package:surah/domain/repositories/quran_repository.dart';

abstract class QuranUseCase {
  Future<List<SurahEntity>> getAllSurah();
}

class QuranUseCaseImpl extends QuranUseCase {
  final QuranRepository quranRepository;

  QuranUseCaseImpl({required this.quranRepository});

  @override
  Future<List<SurahEntity>> getAllSurah() {
    return quranRepository.getAllSurah();
  }
}
