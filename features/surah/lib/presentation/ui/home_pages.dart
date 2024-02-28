import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surah/domain/entities/surah_entities.dart';
import 'package:surah/presentation/bloc/bloc/quran_bloc.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<QuranBloc>(context).add(GetAllSurah());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Quran',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9543FF),
                            ),
                          ),
                          const Text(
                            'Baca Al-Quran Dengan Mudah',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            '19:21',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Ramadan 23, 1444 AH',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff232323),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff763FBC),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                'Shubuh  4:17 AM',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/quran4.png',
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                const Text(
                  'Kategori',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      width: width * 0.2,
                      decoration: BoxDecoration(
                        color: const Color(0xff9543FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            'SURAT',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    Container(
                      width: width * 0.2,
                      decoration: BoxDecoration(
                          // color: const Color(0xff9543FF),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            'DOA',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<QuranBloc, QuranState>(
                  builder: (context, state) {
                    if(state.isLoading == true){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if(state.dataSurah!.isNotEmpty){
                      return Expanded(
                        child: ListView(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            scrollDirection: Axis.vertical,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: List.generate(
                                state.dataSurah!.length,
                                    (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: CardSurat(height: height, width: width, surahEntity: state.dataSurah![index]),
                                ))),
                      );
                    }
                    return SizedBox();

                },)
              ],
            ),
          ),
        ));
  }
}

class CardSurat extends StatelessWidget {
   CardSurat({
    // super.key,
    required this.height,
    required this.width,
    required this.surahEntity
  });

  final double height;
  final double width;
  final SurahEntity surahEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: height * 0.07,
          width: 7,
          decoration: BoxDecoration(
            color:  const Color(0xff9543FF),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Expanded(
          child: Container(
            padding:  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  const Color(0xffFCFCFC),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(2, 5),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration:  const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/bgnumber.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child:  Center(
                        child: Text(
                          surahEntity.number.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.016,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          surahEntity.englishName.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff240F4F),
                          ),
                        ),
                        Row(
                          children: [
                             Text(
                              '${surahEntity.relevationType}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff8789A3),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.014,
                            ),
                             Text(
                              '${surahEntity.numberOfAyat}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff8789A3),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                 Text(
                  '${surahEntity.name}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff863ED5)),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
