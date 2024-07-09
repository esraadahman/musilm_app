import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qurana/features/muslim_features/muslim_features/data/model/duaa_model.dart';
import 'package:qurana/features/muslim_features/muslim_features/data/model/quran_model.dart';
import 'package:qurana/features/muslim_features/muslim_features/data/model/zeker_model.dart';
import 'package:qurana/features/muslim_features/muslim_features/ui/screens/duaa.dart';

part 'muslim_state.dart';

class MuslimCubit extends Cubit<MuslimState> {
  MuslimCubit() : super(MuslimInitial());

  List<AzkerModel> test = azkarElsabah;
  int cateindex = 0;

  changecategory(int index) {
    cateindex = index;

    if (index == 0) {
      test = azkarElsabah;
    } else if (index == 1) {
      test = azkarELmasa2;
    } else if (index == 2) {
      test = azkarba3delsalah;
    } else if (index == 3) {
      test = azkarSleepList;
    } else if (index == 4) {
      test = azkarWakeupList;
    } else {
      test = azkarElsabah;
    }
    emit(MuslimInitial());
  }



  //tasbih ************************
    int tasbehcount = 0;
  
    incresetasbeh() {
    tasbehcount++;
    emit(MuslimInitial());
  }

  resettasbeh() {
    tasbehcount = 0;
    emit(MuslimInitial());
  }





  /* duaa ****************************************/
  List<DuaaModel> duaatest = duaafromQuranList;
  int cateindexforduaa = 0;

    changecategoryduaa(int index) {
    cateindexforduaa = index;

    if (index == 0) {
      duaatest = duaafromQuranList;
    } else if (index == 1) {
      duaatest = duaafromanbya2List;
    } else {
      duaatest = duaafromQuranList;
    }
    emit(MuslimInitial());
  }



  /* quran list */


  String convertNumberToArabic(String englishNumber) {
    if (englishNumber == null || englishNumber.isEmpty) {
      return '';
    }

    Map<String, String> numberMap = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    String arabicNumber = '';
    for (int i = 0; i < englishNumber.length; i++) {
      arabicNumber += numberMap[englishNumber[i]] ?? englishNumber[i];
    }

    return arabicNumber;
  } 

  List<dynamic> quranlist = [];

  getQuranList() async {
    emit(QuranListLoading());
    try {
      quranlist = await quran_model.getQuranList();
      emit(QuranListLoaded());
    } catch (e) {
      emit(QuranListFailed());
    }
  }



  /*  sourah */




  int sizefont = 18;
  bool showsettings = false;

   List<dynamic> surah = [];


  


    getSurah(int id, String lang) async {
    emit(SurahLoading());
    try {
      surah = await quran_model.getSurah(id);
      emit(SurahLoaded());
    } catch (e) {
      emit(SurahFailed());
    }
  }


  

}
