import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/models/prayer_time.dart';
import 'package:islamic_app/service/dio_helper/dio_helper.dart';
import 'package:meta/meta.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  static PrayerTimeCubit get(context) => BlocProvider.of(context);
  PrayerTime? prayerTime;

  getPrayer() {
    emit(PrayerTimeLoadingState());
    DioHelper.getData(url: 'timingsByAddress', query: {
      'address': 'cairo',
      'method': '5'
    })
        .then((value) {
      print(value);
      prayerTime = PrayerTime.fromJson(value.data);

      emit(PrayerTimeSucssessState());
    })
        .catchError((error) {
      emit(PrayerTimeErrorState());
      print(error);
    });
  }

}
