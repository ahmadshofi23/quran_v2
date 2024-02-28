class SurahEntity{
  final int? number;
  final String? name;
  final String? englishName;
  final int? numberOfAyat;
  final String? relevationType;

  SurahEntity({
    this.number,
    this.name,
    this.englishName,
    this.numberOfAyat,
    this.relevationType,
  });

  SurahEntity copyWith({
   int? number,
   String? name,
   String? englishName,
   int? numberOfAyat,
   String? relevationType
  }) => SurahEntity(
    number: number ?? this.number,
    name: name ?? this.name,
    englishName: englishName ?? this.englishName,
    numberOfAyat: numberOfAyat ?? this.numberOfAyat,
    relevationType: relevationType ?? this.relevationType,
  );
}